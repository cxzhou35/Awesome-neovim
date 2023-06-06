return {
  "LunarVim/bigfile.nvim",
  lazy = true,
  opts = {
    filesize = 10, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    pattern = { "*" }, -- autocmd pattern
    features = { -- features to disable
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
    },
  },
}
