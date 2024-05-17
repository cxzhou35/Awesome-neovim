return {
  -- Add BibTeX/LaTeX to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
      end
      if type(opts.highlight.disable) == "table" then
        vim.list_extend(opts.highlight.disable, { "latex" })
      else
        opts.highlight.disable = { "latex" }
      end
    end,
  },

  {
    "lervag/vimtex",
    lazy = true, -- lazy-loading will disable inverse search
    ft = { "tex" },
    keys = { { "<leader>v", ":VimtexView<CR>", desc = "Vimtex Preview" } },
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_syntax_conceal_disable = 1
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_view_enabled = 1
      vim.g.vimtex_view_automatic = 0
      vim.g.vimtex_compiler_silent = 1
      vim.g.vimtex_indent_on_ampersands = 0
      vim.g.vimtex_indent_enabled = 0
      vim.g.vimtex_syntax_conceal = {
        accents = 2,
        cites = 2,
        fancy = 2,
        greek = 2,
        math_bounds = 2,
        math_delimiters = 2,
        math_fracs = 2,
        math_super_sub = 2,
        math_symbols = 2,
        sections = 2,
        styles = 2,
        trailing_whitespace = 0,
      }
      vim.g.vimtex_quickfix_ignore_filters = {
        "LaTeX hooks Warning",
        "Underfull \\hbox",
        "Overfull \\hbox",
        "LaTeX Warning: .+ float specifier changed to",
        'Package siunitx Warning: Detected the "physics" package:',
        "Package hyperref Warning: Token not allowed in a PDF string",
        "Fatal error occurred, no output PDF file produced!",
      }
    end,
  },

  -- Correctly setup lspconfig for LaTeX 🚀
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    },
  },
}
