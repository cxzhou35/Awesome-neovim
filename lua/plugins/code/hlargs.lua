return {
  "m-demare/hlargs.nvim",
  config = function()
    require("hlargs").setup({
      color = "#D49DA5",
      excluded_filetypes = { "tex", "help", "markdown", "vimwiki", "gitcommit" },
    })
  end,
}
