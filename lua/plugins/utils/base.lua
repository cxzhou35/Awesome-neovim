return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "gcmt/wildfire.vim" },
  {
    "rmagatti/alternate-toggler",
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "max397574/better-escape.nvim", event = "InsertEnter", opts = { timeout = 100, keys = "<Esc>" } },
  {
    "NMAC427/guess-indent.nvim",
    opts = {
      auto_cmd = true, -- Set to false to disable automatic execution
      override_editorconfig = false, -- Set to true to override settings set by .editorconfig
      filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
        "netrw",
        "tutor",
      },
      buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
        "help",
        "nofile",
        "terminal",
        "prompt",
      },
    },
  },
}
