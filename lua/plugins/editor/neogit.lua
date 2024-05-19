return {
  "NeogitOrg/neogit",
  lazy = true,
  keys = { { "<leader>ng", "<cmd>Neogit<cr>", desc = "Open Neogit" } },
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim",
  },
  config = true,
}
