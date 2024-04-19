return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LazyFile",
  opts = {
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "neogitstatus",
        "lazyterm",
        "txt",
      },
    },
  },
  main = "ibl",
}
