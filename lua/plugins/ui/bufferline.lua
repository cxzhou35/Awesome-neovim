return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("lazyvim.config").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        mode = "buffers",
        separator_style = "thin",

        always_show_bufferline = true, -- show bufferline always
        view = "multiwindow",
        themable = true,

        show_buffer_icons = true,
        color_icons = true,
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",

        show_close_icon = true,
        close_icon = "",

        show_buffer_close_icons = false,
        buffer_close_icon = "󰅙",

        tab_size = 10,
        show_tab_indicators = true,
        max_name_length = 25,
        enforce_regular_tabs = false,

        numbers = function(opts)
          return string.format("%s.", opts.ordinal)
        end,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,

        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    -- Buffers belong to tabs
    local cache = {}
    local last_tab = 0

    local utils = {}

    utils.is_valid = function(buf_num)
      if not buf_num or buf_num < 1 then
        return false
      end
      local exists = vim.api.nvim_buf_is_valid(buf_num)
      return vim.bo[buf_num].buflisted and exists
    end

    utils.get_valid_buffers = function()
      local buf_nums = vim.api.nvim_list_bufs()
      local ids = {}
      for _, buf in ipairs(buf_nums) do
        if utils.is_valid(buf) then
          ids[#ids + 1] = buf
        end
      end
      return ids
    end
    local autocmd = vim.api.nvim_create_autocmd

    autocmd("TabEnter", {
      callback = function()
        local tab = vim.api.nvim_get_current_tabpage()
        local buf_nums = cache[tab]
        if buf_nums then
          for _, k in pairs(buf_nums) do
            vim.api.nvim_buf_set_option(k, "buflisted", true)
          end
        end
      end,
    })
    autocmd("TabLeave", {
      callback = function()
        local tab = vim.api.nvim_get_current_tabpage()
        local buf_nums = utils.get_valid_buffers()
        cache[tab] = buf_nums
        for _, k in pairs(buf_nums) do
          vim.api.nvim_buf_set_option(k, "buflisted", false)
        end
        last_tab = tab
      end,
    })
    autocmd("TabClosed", {
      callback = function()
        cache[last_tab] = nil
      end,
    })
    autocmd("TabNewEntered", {
      callback = function()
        vim.api.nvim_buf_set_option(0, "buflisted", true)
      end,
    })
  end,
}
