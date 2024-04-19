return {
  "sainnhe/everforest",
  lazy = true,
  config = function()
    -- Themes everforest
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.g.everforest_diagnostic_text_highlight = 0
    vim.g.everforest_better_performance = 1
    vim.g.everforest_background = "soft"
    vim.g.everforest_dim_inactive_windows = 1
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_ui_contrast = "high"
    vim.g.everforest_disable_terminal_colors = 0
  end,
}
