vim.cmd("autocmd!")
local opt = vim.opt
local api = vim.api

-- General
opt.number = true
opt.relativenumber = true
opt.title = true
opt.title = true
opt.hlsearch = true
opt.incsearch = true
opt.shell = "zsh"
opt.backup = false
opt.showcmd = true
opt.compatible = false
opt.cmdheight = 1
opt.laststatus = 2
opt.updatetime = 100
opt.wrap = false -- No Wrap lines
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smartcase = true
opt.backspace = { "start", "eol", "indent" }
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.swapfile = false
opt.inccommand = "split"
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })
opt.list = true
opt.listchars = { extends = "❯", precedes = "❮", trail = "·", tab = "▸ " }
opt.mouse = "a"
opt.iskeyword:append("-")
opt.laststatus = 2
opt.syntax = "on"
-- opt.wrap = true

-- Tab & Indent
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.softtabstop = 0
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.signcolumn = "yes"

-- Window
opt.splitright = false
opt.splitbelow = false

-- Clipboard
opt.clipboard = { "unnamed", "unnamedplus" }

-- Coding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "gbk", "gb2312" }
opt.termencoding = "utf-8"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })
