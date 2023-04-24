return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "terminal" },
    buftype_exclude = { "terminal", "nofile", "toggleterm" },
    use_treesitter = true,
    show_trailing_blankline_indent = true,
    show_current_context = false,
  },
}
