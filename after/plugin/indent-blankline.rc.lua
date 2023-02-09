local status, indentbl = pcall(require, 'indent_blankline')
if (not status) then return end

vim.cmd("autocmd!")
vim.cmd("highlight IndentBlanklineIndent1 guifg=#7991d1 gui=nocombine")
vim.cmd("highlight IndentBlanklineIndent2 guifg=#2578b5 gui=nocombine")
vim.cmd("highlight IndentBlanklineIndent3 guifg=#5e90b8 gui=nocombine")
vim.cmd("highlight IndentBlanklineIndent4 guifg=#3c5e91 gui=nocombine")
vim.cmd("highlight IndentBlanklineIndent5 guifg=#DBE7ED gui=nocombine")
vim.cmd("highlight IndentBlanklineIndent6 guifg=#ADC5CF gui=nocombine")

indentbl.setup({
    space_char_blankline = " ",
    show_current_context = true,
    char_highlight_list = {
        "IndentBlanklineIndent1", "IndentBlanklineIndent2",
        "IndentBlanklineIndent3", "IndentBlanklineIndent4",
        "IndentBlanklineIndent5", "IndentBlanklineIndent6"
    }
})
