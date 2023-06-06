return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinNew" },
  config = function()
    require("colorful-winsep").setup({
      -- highlight for Window separator
      highlight = {
        bg = "#16161E",
        fg = "#1F3442",
      },
      -- timer refresh rate
      interval = 30,
      -- This plugin will not be activated for filetype in the following table.
      no_exec_files = {
        "TelescopePrompt",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "terminal",
        "neogitstatus",
        "mason",
      },
      -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
      symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
      close_event = function()
        -- Executed after closing the window separator
      end,
      create_event = function()
        -- Executed after creating the window separator
      end,
    })
  end,
}
