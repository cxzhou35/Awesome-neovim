return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "terminal", "neogitstatus" },
    buftype_exclude = { "terminal", "nofile", "toggleterm" },
    context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    },
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_current_context = true,
  },
}
