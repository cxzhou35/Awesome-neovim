local state, terminal = pcall(require, 'toggleterm')
if (not state) then return end

terminal.setup({
    open_mapping = [[<C-\>]],
    shell = vim.o.shell,
    hide_numbers = true,
    direction = "float",
    float_opts = {border = "single", width = 110},
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    }
})

local Terminal = require('toggleterm.terminal').Terminal

-- Lazygit
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    dir = "git_dir",
    direction = "float",
    float_opts = {border = "single"}
})

function _lazygit_toggle() lazygit:toggle() end

vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>lua _lazygit_toggle()<CR>",
                        {noremap = true, silent = true})

-- Btop
local btop = Terminal:new({
    cmd = "btop",
    hidden = true,
    direction = "float",
    float_opts = {border = "single"}
})

function _btop_toggle() btop:toggle() end

vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua _btop_toggle()<CR>",
                        {noremap = true, silent = true})

-- Ranger
local ranger = Terminal:new({
    cmd = "ranger",
    hidden = true,
    direction = "float",
    float_opts = {border = "single"}
})

function _ranger_toggle() ranger:toggle() end

vim.api.nvim_set_keymap("n", "<C-r>", "<cmd>lua _ranger_toggle()<CR>",
                        {noremap = true, silent = true})
