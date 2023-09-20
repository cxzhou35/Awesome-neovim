-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local api = vim.api
local g = vim.g
local o = vim.o
local utils = require("utils")

g.mapleader = " "
g.maplocalleader = " "

-- General
opt.relativenumber = false
opt.number = true
opt.ruler = false
opt.autowrite = true
opt.cul = true
opt.iskeyword:append("-")
opt.swapfile = false
opt.showmode = false
opt.backspace = { "start", "eol", "indent" }
opt.title = true
opt.completeopt = "menu,menuone,noselect"
opt.backup = false
opt.ignorecase = true
opt.undofile = true
opt.wildmenu = true
opt.wildmode = "longest:list,full"
opt.cmdheight = 0
opt.laststatus = 3
opt.splitkeep = "screen"
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
o.showtabline = 0
o.scrolloff = 10

-- Clipboard
opt.clipboard = { "unnamed", "unnamedplus" }

-- Chars
opt.list = true
opt.listchars = {
  extends = "❯",
  precedes = "❮",
  trail = "·",
  tab = "▸ ",
  -- eol = "↴",
}
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Spell
opt.spell = true
opt.spelllang = { "en_us" }

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

utils.set_indent_sizes({
  go = 4,
  python = 4,
  rust = 4,
  cpp = 4,
  markdown = 4,
  c = 4,
  make = 4,
  lua = 2,
  yaml = 2,
  json = 2,
})

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "gbk", "gb2312" }
opt.termencoding = "utf-8"

-- Color
o.pumblend = 0
o.winblend = 0
opt.termguicolors = true

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", { pattern = "***", command = "set nopaste" })

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Wildfire
g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "ip", "it", "i`", "i*" }

-- Disable nvim intro
opt.shortmess:append("sI")
