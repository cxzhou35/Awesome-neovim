return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", false },
    { "<S-l>", false },
    { "<C-k>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<C-j>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = {
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

      show_close_icon = false,
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
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
