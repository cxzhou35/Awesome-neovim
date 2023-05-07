return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "justinhj/battery.nvim",
    opts = {
      show_plugged_icon = true,
      show_unplugged_icon = true,
      show_percent = true,
    },
  },
  event = "VeryLazy",
  opts = function()
    local icons = require("lazyvim.config").icons

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      end
    end

    local function nvim_battery()
      return require("battery").get_status_line()
    end

    local function getLspName()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return "  " .. client.name
        end
      end
      return "  " .. msg
    end

    return {
      options = {
        theme = "auto",
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
            filetype_names = {
              TelescopePrompt = "Telescope",
              lazy = "Lazy",
              packer = "Packer",
              fzf = "FZF",
            },
          },
          {
            "filename",
            path = 1,
            symbols = {
              added = "󱪞",
              removed = "󱪜",
              modified = "󰷉",
              readonly = "󱪠",
              unnamed = "󱪘",
              directory = "",
            },
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
              bug = icons.diagnostics.Bug,
            },
          },
          { getLspName },
          -- stylua: ignore
          -- {
          --   function() return require("nvim-navic").get_location() end,
          --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          -- },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = fg("Statement")
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = fg("Constant") ,
          },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%R")
            end,
          },
          { nvim_battery },
          { require("copilot_status").status_string },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
