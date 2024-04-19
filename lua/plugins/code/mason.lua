return {
  "williamboman/mason.nvim",
  keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      "stylua",
      "luacheck",

      "marksman",
      "shfmt",

      "black",
    },
  },
}
