return {
  {
    "phaazon/hop.nvim",
    version = "v2",
    keys = {
      { "<leader>hw", "<cmd>HopWord<CR>", desc = "HopWord" },
      { "<leader>h1", "<cmd>HopChar1<CR>", desc = "HopChar1" },
      { "<leader>h2", "<cmd>HopChar2<CR>", desc = "HopChar2" },
      { "<leader>hp", "<cmd>HopPattern<CR>", desc = "HopPattern" },
      { "<leader>hl", "<cmd>HopLineStart<CR>", desc = "HopLineStart" },
      { "<leader>hv", "<cmd>HopVertical<CR>", desc = "HopVertical" },
    },
    opts = {
      keys = "etovxqpdygfblzhckisuran",
      quit_key = "<ESC>",
      jump_on_sole_occurrence = true,
      case_insensitive = true,
    },
  },
}
