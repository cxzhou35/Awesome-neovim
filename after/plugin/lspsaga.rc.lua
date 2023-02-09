local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
    -- ui config
    ui = {
        -- Currently, only the round theme exists
        theme = "round",
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {}
    },
    -- winbar config
    symbol_in_winbar = {
        enable = true,
        show_file = true,
        separator = "  ",
        hide_keyword = true,
        folder_level = 3,
        respect_root = false,
        color_mode = true
    },
    -- lightbulb config
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true
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
        keys = {exec_action = "o", quit = "q", go_action = "g"}
    },
    -- finder icons
    finder_icons = {def = '  ', ref = '諭 ', link = '  '},
    -- finder config
    finder = {
        jump_to = 'p',
        edit = {"o", "<CR>"},
        tabe = "t",
        quit = {"q", "<ESC>"}
    },
    -- show outline
    outline = {
        win_position = 'right',
        win_with = '',
        win_width = 25,
        auto_enter = true,
        auto_preview = false,
        virt_text = '┃',
        keys = {jump = "o", expand_collapse = "u", quit = "q"},
        -- auto refresh when change buffer
        auto_refresh = true
    },
    -- difinition config
    definition = {
        edit = "<S-c>o",
        vsplit = "<S-c>v",
        split = "<S-c>i",
        tabe = "<S-c>t",
        quit = "q",
        close = "<Esc>"
    },
    -- code action config
    code_action = {
        num_shortcut = true,
        keys = {
            -- string | table type
            quit = "q",
            exec = "<CR>"
        }
    },
    request_timeout = 5000
})
