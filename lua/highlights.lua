local set = vim.opt

set.cursorline = true
set.termguicolors = true
set.winblend = 0
set.wildoptions = 'pum'
set.pumblend = 0
set.background = 'dark'

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({higroup = 'IncSearch', timeout = 300})
    end
})
