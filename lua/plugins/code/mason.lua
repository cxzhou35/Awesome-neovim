return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      -- lua
      "stylua",
      "luacheck",

      -- shell
      "shellcheck",
      "shfmt",

      -- c/cpp
      "clangd",

      -- markdown
      "marksman",
      "cbfmt",

      -- latex
      "texlab",

      -- python
      "pyright",
      "black",
    })
  end,
  keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
}
