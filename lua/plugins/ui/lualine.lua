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
    local util = LazyVim.ui

    local colors = {
      [""] = util.fg("Special"),
      ["Normal"] = util.fg("Special"),
      ["Warning"] = util.fg("DiagnosticError"),
      ["InProgress"] = util.fg("DiagnosticWarn"),
    }

    local function nvim_battery()
      return require("battery").get_status_line()
    end

    local function getLspName()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_clients()
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

    -- local function getWords()
    --   if vim.fn.getfsize(vim.fn.expand("%")) > 200000 then
    --     return ""
    --   end
    --
    --   if vim.fn.wordcount().visual_words == 1 then
    --     return "1 word"
    --   elseif not (vim.fn.wordcount().visual_words == nil) then
    --     return tostring(vim.fn.wordcount().visual_words) .. " words"
    --   else
    --     if vim.fn.wordcount().words == 1 then
    --       return "1 word"
    --     else
    --       return tostring(vim.fn.wordcount().words) .. " words"
    --     end
    --   end
    -- end

    return {
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
            path = 0, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory
            symbols = {
              added = "󱪞",
              removed = "󱪜",
              modified = "󰷉",
              readonly = "󱪠",
              unnamed = "󱪘",
              directory = "",
            },
          },
          { getLspName },
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
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = util.fg("Statement")
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = util.fg("Constant"),
          },
          -- copilot status module
          {
            function()
              local icon = require("lazyvim.config").icons.kinds.Copilot
              local status = require("copilot.api").status.data
              return icon .. (status.message or "")
            end,
            cond = function()
              local ok, clients = pcall(LazyVim.lsp.get_clients, { name = "copilot", bufnr = 0 })
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded["copilot"] then
                return
              end
              local status = require("copilot.api").status.data
              return colors[status.status] or colors[""]
            end,
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = util.fg("Special"),
          },
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
          -- { getWords },
          {
            function()
              return " " .. os.date("%R")
            end,
          },
          -- battery status
          { nvim_battery },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
