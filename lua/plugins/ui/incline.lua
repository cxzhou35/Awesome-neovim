return {
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("catppuccin.palettes.macchiato")
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guifg = colors.lavender, guibg = colors.base },
            InclineNormalNC = { guifg = colors.pink, guibg = colors.base },
          },
        },
        window = {
          margin = { vertical = 0, horizontal = 1 },
          placement = {
            horizontal = "right",
            vertical = "top",
          },
        },
        hide = {
          cursorline = false,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return {
            { icon, guifg = color },
            { " " },
            { filename },
            { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows", guifg = colors.teal },
          }
        end,
      })
    end,
  },
}
