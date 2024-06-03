return {
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
      aggressive_mode = false,
      excluded_lsp_clients = {},
    },
  },
}
