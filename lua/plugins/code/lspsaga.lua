return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    keys = {
      { "ga", "<cmd>Lspsaga code_action<CR>", desc = "Lspsaga Code Action" },
      { "gf", "<cmd>Lspsaga finder<CR>", desc = "Lspsaga Finder" },
      { "go", "<cmd>Lspsaga outline<CR>", desc = "Lspsaga Outline" },
      { "gh", "<cmd>Lspsaga hover_doc<CR>", desc = "Lspsaga Hover" },
      { "gt", "<cmd>Lspsaga term_toggle<CR>", desc = "Lspsaga Float Terminal" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Lspsaga Peek Definition" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Lspsaga Goto Definition" },
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Lspsaga Show Line Diagnostics" },
      { "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Lspsaga Diagnsotic Jump Next" },
      { "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Lspsaga Diagnsotic Jump Previous" },
    },
    opts = {
      ui = {
        theme = "round",
        title = true,
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = "󰏷 ",
        outgoing = "󰏻 ",
        hover = " ",
        colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
      },
      -- winbar config
      symbol_in_winbar = {
        enable = true,
        show_file = true,
        separator = "  ",
        hide_keyword = false,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      -- lightbulb config
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
      },
      -- diagnostic config
      diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        -- 1 is max
        max_width = 0.7,
        custom_fix = nil,
        custom_msg = nil,
        text_hl_follow = false,
        keys = { exec_action = "o", quit = "q", go_action = "g" },
      },
      -- finder icons
      finder_icons = { def = "  ", ref = "󰵚 ", link = "󰴜 " },
      -- finder config
      finder = {
        jump_to = "p",
        edit = { "o", "<CR>" },
        tabe = "t",
        quit = { "q", "<ESC>" },
      },
      -- show outline
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        auto_enter = true,
        detail = false,
        auto_preview = false,
        virt_text = "┃",
        keys = { jump = "o", toggle_or_jump = "f", quit = "q" },
        -- auto refresh when change buffer
        auto_refresh = true,
      },
      -- difinition config
      definition = {
        edit = "<S-c>o",
        vsplit = "<S-c>v",
        split = "<S-c>i",
        tabe = "<S-c>t",
        quit = "q",
        close = "<Esc>",
      },
      -- code action config
      code_action = {
        num_shortcut = true,
        keys = {
          -- string | table type
          quit = "q",
          exec = "<CR>",
        },
      },
      request_timeout = 3000,
    },
  },
}
