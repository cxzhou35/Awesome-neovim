return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    opts = {
      base_url = "https://carbon.now.sh/",
      open_cmd = "open -a 'Google Chrome'",
      options = {
        theme = "material",
        window_theme = "none",
        background_mode = "color",
        bg = "white",
        background_color = "rgba(240, 231, 231, 1.0)",
        font_family = "Hack",
        font_size = "16px",
        line_numbers = true,
        line_height = "133%",
        drop_shadow = true,
        drop_shadow_offset_y = "26px",
        drop_shadow_blur = "68px",
        drop_shadow_blur_radius = "49px",
        padding_vertical = "44px",
        padding_horizontal = "37px",
        width = "680",
        width_adjustment = "false",
        first_line_number = "1",
        watermark = false,
      },
    },
  },
  { "windwp/nvim-autopairs", lazy = true },
  { "gcmt/wildfire.vim" },
  {
    "Pocco81/HighStr.nvim",
    lazy = true,
    opts = {
      verbosity = 0,
      saving_path = "/tmp/highstr/",
      highlight_colors = {
        color_0 = { "#0c0d0e", "smart" }, -- Cosmic charcoal
        color_1 = { "#d1e2de", "smart" }, -- Pastel yellow
        color_2 = { "#7FFFD4", "smart" }, -- Aqua menthe
        color_3 = { "#8A2BE2", "smart" }, -- Proton purple
        color_4 = { "#FF4500", "smart" }, -- Orange red
        color_5 = { "#008000", "smart" }, -- Office green
        color_6 = { "#0000FF", "smart" }, -- Just blue
        color_7 = { "#FFC0CB", "smart" }, -- Blush pink
        color_8 = { "#FFF9E3", "smart" }, -- Cosmic latte
        color_9 = { "#7d5c34", "smart" }, -- Fallow brown
      },
    },
  },
  {
    "phaazon/hop.nvim",
    version = "v2",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
      quit_key = "<ESC>",
      jump_on_sole_occurrence = true,
      case_insensitive = true,
    },
  },
  { "tjdevries/colorbuddy.nvim", lazy = true },
  { "norcalli/nvim-colorizer.lua", lazy = true },
}
