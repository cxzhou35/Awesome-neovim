return {
  { "gcmt/wildfire.vim" },
  {
    "rmagatti/alternate-toggler",
    keys = {
      { "<leader>at", "<cmd>ToggleAlternate<CR>", desc = "Toggle Alternate" },
    },
    opts = {
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["yes"] = "no",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["=="] = "!=",
      },
    },
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "max397574/better-escape.nvim", event = "InsertEnter", opts = { timeout = 100, keys = "<Esc>" } },
  {
    "ellisonleao/carbon-now.nvim",
    event = "BufRead",
    keys = { { "<leader>cn", "<cmd>CarbonNow<CR>", mode = { "v", "n" }, desc = "Carbon Now" } },
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
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads" },
      })
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    opts = { filesize = 10 },
    features = { -- features to disable
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
    },
  },
  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    keys = {
      { "gx", "<esc>:URLOpenUnderCursor<cr>", desc = "Open URL under cursor" },
    },
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
}
