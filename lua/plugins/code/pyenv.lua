return {
  "linux-cultist/venv-selector.nvim",
  cmd = "VenvSelect",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  opts = {
    search = false,
    name = {
      "venv",
      ".venv",
      "env",
      "envs",
      ".env",
    },
    anaconda_base_path = "/Users/vercent/miniconda3",
    anaconda_envs_path = "/Users/vercent/miniconda3/envs",
    -- enable_debug_output = true
  },
  keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
}
