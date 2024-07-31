return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        -- python = { "isort", "black" },
        python = { "isort", "autopep8" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        -- markdown = { "markdownlint" },
        markdown = { "prettier" },
        tex = { "latexindent" },
        sh = { "shfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
    return opts
  end,
}
