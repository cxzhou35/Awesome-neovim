return {
  "lewis6991/satellite.nvim",
  config = function()
    require("satellite").setup({
      current_only = false,
      winblend = 20, -- default value: 50
      zindex = 40, -- default value: 40
      width = 2,
      excluded_filetypes = {
        "TelescopePrompt",
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "terminal",
        "neogitstatus",
        "mason",
        "prompt",
        "noice",
        "neo-tree-popup",
      },
      excluded_buftypes = { "terminal", "nofile", "toggleterm" },
      handlers = {
        search = {
          enable = true,
        },
        diagnostic = {
          enable = true,
          signs = { "-", "=", "≡" },
          min_severity = vim.diagnostic.severity.HINT,
        },
        gitsigns = {
          enable = true,
          signs = { -- can only be a single character (multibyte is okay)
            add = "│",
            change = "│",
            delete = "-",
          },
        },
        marks = {
          enable = true,
          show_builtins = false, -- shows the builtin marks like [ ] < >
        },
      },
    })
  end,
}
