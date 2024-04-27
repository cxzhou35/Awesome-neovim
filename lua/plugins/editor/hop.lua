return {
  {
    "phaazon/hop.nvim",
    version = "v2",
    keys = {
      { "hw", "<cmd>HopWord<CR>", desc = "HopWord" },
      { "h1", "<cmd>HopChar1<CR>", desc = "HopChar1" },
      { "h2", "<cmd>HopChar2<CR>", desc = "HopChar2" },
      { "hp", "<cmd>HopPattern<CR>", desc = "HopPattern" },
      { "hl", "<cmd>HopLineStart<CR>", desc = "HopLineStart" },
      { "hv", "<cmd>HopVertical<CR>", desc = "HopVertical" },
    },
    opts = {
      keys = "etovxqpdygfblzhckisuran",
      quit_key = "<ESC>",
      jump_on_sole_occurrence = true,
      case_insensitive = true,
    },
  },
}
