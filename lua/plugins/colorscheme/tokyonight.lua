return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = true },
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent", -- style for sidebars
      floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    lualine_bold = true,
  },
}
