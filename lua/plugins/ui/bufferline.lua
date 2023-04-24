return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>p", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>P", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    options = {
      mode = "buffer",
      separator_style = "thin",
      always_show_bufferline = true, -- show bufferline always
      show_buffer_close_icons = false,
      show_buffer_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      color_icons = true,
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      tab_size = 15,
      max_name_length = 25,
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
      highlights = {
        separator = {
          fg = "#073642",
          bg = "#002b36",
        },
        separator_selected = {
          fg = "#073642",
        },
        background = {
          fg = "#657b83",
          bg = "#002b36",
        },
        buffer_selected = {
          fg = "#fdf6e3",
          bold = true,
        },
        fill = {
          bg = "#073642",
        },
      },
    },
  },
}
