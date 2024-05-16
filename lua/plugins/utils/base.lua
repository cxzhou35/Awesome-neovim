return {
  { "gcmt/wildfire.vim" },
  {
    "rmagatti/alternate-toggler",
    keys = {
      { "<leader>at", "<cmd>ToggleAlternate<CR>", desc = "Toggle Alternate" },
    },
    opts = {
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["yes"] = "no",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["=="] = "!=",
      },
    },
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "max397574/better-escape.nvim", event = "InsertEnter", opts = { timeout = 100, keys = "<Esc>" } },
}
