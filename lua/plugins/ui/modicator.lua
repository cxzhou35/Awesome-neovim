return {
  "mawkler/modicator.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = {
    show_warnings = true,
    highlights = {
      defaults = {
        bold = true,
        italic = true,
      },
    },
  },
}
