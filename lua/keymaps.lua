local keymap = vim.keymap

-- Leader key
vim.g.mapleader = '\\'

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- edit init.lua
keymap.set('n', ';v', ':e $MYVIMRC<CR>')

-- Split window
keymap.set('n', 's', '<nop>')
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true})
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent = true})

-- Change window
keymap.set('n', '<Space>w', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Tab
keymap.set('n', '<C-n>', ':tabnew<Return>')
keymap.set('n', '<C-j>', '<cmd>BufferLineCycleNext<CR>', {})
keymap.set('n', '<C-k>', '<cmd>BufferLineCyclePrev<CR>', {})
keymap.set('n', '<C-q>', ':bdelete<CR>')

-- Indent
keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')
keymap.set('n', '<', '<<')
keymap.set('n', '>', '>>')

-- Move cursor
keymap.set('n', '<S-h>', '^')
keymap.set('n', '<S-j>', '5j')
keymap.set('n', '<S-k>', '5k')
keymap.set('n', '<S-l>', 'g_')
keymap.set('v', '<S-h>', '^')
keymap.set('v', '<S-j>', '5j')
keymap.set('v', '<S-k>', '5k')
keymap.set('v', '<S-l>', 'g_')

-- Number
keymap.set('v', '+', 'g<C-a>')
keymap.set('v', '-', 'g<C-x>')

-- Sort
keymap.set('v', '<leader>s', ':sort<CR>')
keymap.set('v', '<leader>i', ':sort!<CR>')

-- No highlight
keymap.set('', '<C-h>', ':noh<CR>')

-- Undo
keymap.set('n', '<S-u>', ':u<CR>')

-- File
keymap.set('n', '<C-s>', ':wa<CR>')
keymap.set('n', '<S-s>', '<nop>')
keymap.set('n', 'fq', ':q!<CR>')
keymap.set('n', 'fwq', ':wqa<CR>')

-- Nvim-tree
keymap.set('n', '<F2>', ':NvimTreeFindFileToggle<CR>')

-- Match
keymap.set('', 'm', '%')

-- Wildfire
keymap.set('', '<Space>', '<Plug>(wildfire-fuel)')

-- Surround
keymap.set('n', 'vw', 'vaw')
keymap.set('n', 'vp', 'vap')
keymap.set('n', 'vb', 'vab')

-- Yank
keymap.set('n', 'yp', 'yyp')
keymap.set('n', 'yw', 'yaw')

-- Picgo
keymap.set('', '<C-u>', ':UploadClipboard<CR>')

-- Markdown Preview
keymap.set('', '<C-p>', '<Plug>MarkdownPreviewToggle')

-- Undotree
keymap.set('n', '<leader>ut', ':UndotreeToggle<CR>')

-- Lspsga
keymap.set('n', '<leader>sp', ':LspStop<CR>')
keymap.set('n', '<leader>sa', ':LspStart<CR>')
keymap.set('n', '<leader>rs', ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Telescope
local builtin = require("telescope.builtin")

keymap.set('n', ';f', function()
    builtin.find_files({no_ignore = false, hidden = true})
end)
keymap.set('n', ';r', function() builtin.live_grep() end)
keymap.set('n', ';b', function() builtin.buffers() end)
keymap.set('n', ';o', function() builtin.oldfiles() end)
keymap.set('n', ';;', function() builtin.resume() end)
keymap.set('n', ';e', function() builtin.diagnostics() end)
keymap.set('n', ';c', function() builtin.colorscheme() end)
keymap.set('n', ';k', function() builtin.keymaps() end)
keymap.set('n', ';l', function() builtin.reloader() end)
keymap.set('n', ';g', function() builtin.git_commits() end)
keymap.set('n', ';t', ":TodoTelescope<CR>")

-- Lspsaga
local opts = {silent = true, noremap = true}
keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts) -- Code Action
keymap.set("n", "ge", "<cmd>Lspsaga lsp_finder<CR>", opts) -- Finder
keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts) -- Rename
keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts) -- Outline
keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- Hover Doc
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek Definition
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- Goto Definition
keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Show line diagnostics
keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Show cursor diagnostic
keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Diagnsotic jump
keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Diagnsotic jump
keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Signature Help
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Implementation
keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format()<CR>", {silent = true}) -- Format

-- Only jump to error
keymap.set("n", "[e", function()
    require("lspsaga.diagnostic").goto_prev({
        severity = vim.diagnostic.severity.ERROR
    })
end, opts)
keymap.set("n", "]e", function()
    require("lspsaga.diagnostic").goto_next({
        severity = vim.diagnostic.severity.ERROR
    })
end, opts)

-- Troublbe
keymap.set("n", "t", '<nop>')
keymap.set("n", "tt", "<cmd>TroubleToggle<CR>", opts)
keymap.set("n", "tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
keymap.set("n", "td", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
keymap.set("n", "tl", "<cmd>TroubleToggle loclist<CR>", opts)
keymap.set("n", "tq", "<cmd>TroubleToggle quickfix<CR>", opts)
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", opts)

-- Lightspeed jump
keymap.set('n', 'q', '<nop>')
keymap.set('n', '<leader>h', '<Plug>Lightspeed_s')
keymap.set('n', '<leader>l', '<Plug>Lightspeed_S')
keymap.set('n', '<leader>j', '<Plug>Lightspeed_f')
keymap.set('n', '<leader>k', '<Plug>Lightspeed_F')

-- Bookmark
keymap.set('n', 'mm', '<Plug>BookmarkToggle')
keymap.set('n', 'mj', '<Plug>BookmarkNext')
keymap.set('n', 'mk', '<Plug>BookmarkPrev')
keymap.set('n', 'mc', '<Plug>BookmarkClear')
keymap.set('n', 'mx', '<Plug>BookmarkClearAll')
keymap.set('n', 'mi', '<Plug>BookmarkAnnotate')
keymap.set('n', 'ma',
           "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>")
keymap.set('n', 'mn',
           "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>")

-- Todo-comments
keymap.set("n", "]t", function() require("todo-comments").jump_next() end,
           {desc = "Next todo comment"})
keymap.set("n", "[t", function() require("todo-comments").jump_prev() end,
           {desc = "Previous todo comment"})
keymap.set("n", "td", ":TodoLocList<cr>")

-- Maximize
keymap.set('n', 'sm', ':MaximizerToggle<CR>')

-- Alternate toggler
keymap.set('n', '<leader>at', ':ToggleAlternate<CR>')

-- Noice history
keymap.set("n", "<leader>nh", function() require("noice").cmd("history") end)

keymap.set('n', '<space>e', vim.diagnostic.open_float,
           {silent = true, noremap = true})

-- Highlight string
vim.api.nvim_set_keymap("v", "zh", ":<c-u>HSHighlight 1<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap("v", "zn", ":<c-u>HSRmHighlight<CR>",
                        {noremap = true, silent = true})
