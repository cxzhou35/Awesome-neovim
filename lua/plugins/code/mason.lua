return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "stylua",
      "luacheck",
      "shellcheck",
      "shfmt",
      "black",
      "flake8",
      "pyright",
      "clangd",
      "marksman",
      "texlab",
    })
  end,
  keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
}
