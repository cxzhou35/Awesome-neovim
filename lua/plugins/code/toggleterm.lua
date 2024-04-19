return {

  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    highlights = {
      Normal = { link = "Normal" },
      NormalNC = { link = "NormalNC" },
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
      StatusLine = { link = "StatusLine" },
      StatusLineNC = { link = "StatusLineNC" },
      WinBar = { link = "WinBar" },
      WinBarNC = { link = "WinBarNC" },
    },
    open_mapping = [[<C-\>]],
    size = 10,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    direction = "float",
    float_opts = { border = "rounded" },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}
