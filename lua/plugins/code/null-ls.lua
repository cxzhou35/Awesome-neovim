return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        -- add sources
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.clang_format,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.markdownlint,
        nls.builtins.formatting.mdformat,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.black,
        nls.builtins.formatting.latexindent,
      },
    }
  end,
}
