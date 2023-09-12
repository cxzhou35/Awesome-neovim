return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- Available themes: 'nordic', 'onedark'.
    -- Onedark is WIP.
    theme = "nordic",
    -- Enable bold keywords.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = true,
    -- Enable brighter float border.
    bright_border = true,
    -- Nordic specific options.
    -- Set all to false to use original Nord colors.
    -- Adjusts some colors to make the theme a bit nicer (imo).
    nordic = {
      -- Reduce the overall amount of blue in the theme (diverges from base Nord).
      reduced_blue = true,
    },
    override = {},
    cursorline = {
      -- Enable bold font in cursorline.
      bold = false,
      -- Avialable styles: 'dark', 'light'.
      theme = "dark",
      -- Hide the cursorline when the window is not focused.
      hide_unfocused = true,
    },
    noice = {
      -- Available styles: `classic`, `flat`.
      style = "classic",
    },
    telescope = {
      -- Available styles: `classic`, `flat`.
      style = "classic",
    },
    leap = {
      -- Dims the backdrop when using leap.
      dim_backdrop = false,
    },
  },
}
