return {
  {
    -- TODO: add btop/ranger supports
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    config = true,
    opts = {
      open_mapping = [[<C-\>]],
      shell = vim.o.shell,
      hide_numbers = true,
      direction = "horizontal",
      size = 15,
      float_opts = { border = "single", width = 110 },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    },
  },
}
