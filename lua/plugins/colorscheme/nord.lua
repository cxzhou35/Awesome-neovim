return {
  -- Themes nord
  "shaunsingh/nord.nvim",
  lazy = true,
  config = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = true
    vim.g.nord_cursorline_transparent = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false
    vim.g.nord_italic = false
  end,
}
