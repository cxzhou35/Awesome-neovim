vim.cmd("autocmd!")
local g = vim.g

-- Airline
-- g.airline_theme = 'base16_nord'
-- g.airline_powerline_fonts = 1
-- g.airline_extensions = {'branch', 'battery', 'nvimlsp'}
-- g['airline#extensions#battery#enabled'] = 1
-- g['airline#extensions#nvimlsp#enabled'] = 1
-- g['airline#extensions#branch#enabled'] = 1
-- g['battery#update_statusline'] = 1

-- Indentline
g.indentLine_enabled = 1
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
g.indent_blankline_filetype_exclude = {
    "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree",
    "Trouble"
}

-- Bullets
g.bullets_enabled_file_types = {'markdown', 'text'}
g.bullets_enable_in_empty_buffers = 0
g.bullets_pad_right = 0

-- Bookmark
g.bookmark_sign = '♥'
g.bookmark_highlight_lines = 1
g.bookmark_save_per_working_dir = 1
g.bookmark_manage_per_buffer = 1
g.bookmark_auto_save = 1

-- Markdown
g.vim_markdown_folding_disabled = 1
g.vim_markdown_toc_autofit = 1
g.vim_markdown_math = 1
g.vim_markdown_json_frontmatter = 1
g.vim_markdown_strikethrough = 1

-- Markdown Preview
g.mkdp_theme = 'dark'
-- g.mkdp_markdown_css = "/Users/vercent/share/mdtheme.css"

-- Vim-table-mode
g.table_mode_corner = '|'

-- Undotree
g.undotree_WindowLayout = 3
g.undotree_SplitWidth = 26
g.undotree_DiffpanelHeight = 10
g.undotree_SetFocusWhenToggle = 1

-- Define Sign
vim.fn.sign_define({
    {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine'
    }, {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine'
    }, {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine'
    }, {
        name = 'DiagnosticSignHint',
        text = 'ﴞ',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine'
    }
})
