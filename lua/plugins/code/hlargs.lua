return {
  "m-demare/hlargs.nvim",
  config = function()
    require("hlargs").setup({
      excluded_filetypes = { "tex", "help", "markdown", "vimwiki", "gitcommit" },
    })
  end,
}
