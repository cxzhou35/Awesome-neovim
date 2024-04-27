return {
  { "gcmt/wildfire.vim" },
  {
    "rmagatti/alternate-toggler",
    keys = {
      { "<leader>at", "<cmd>ToggleAlternate<CR>", desc = "Toggle Alternate" },
    },
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "max397574/better-escape.nvim", event = "InsertEnter", opts = { timeout = 100, keys = "<Esc>" } },
}
