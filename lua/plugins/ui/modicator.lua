return {
  "mawkler/modicator.nvim",
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    show_warnings = false,
    highlights = {
      defaults = {
        bold = true,
        italic = true,
      },
    },
    integration = {
      lualine = {
        enabled = true,
        mode_section = nil,
        highlight = "bg",
      },
    },
  },
}
