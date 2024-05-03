local opt = vim.opt
local wo = vim.wo
local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = " "

-- General
opt.confirm = true
opt.relativenumber = true
opt.number = true
opt.autowrite = true
opt.cul = true
opt.iskeyword:append("-")
opt.swapfile = false
opt.showmode = false
opt.backspace = { "start", "eol", "indent" }
opt.title = true
opt.completeopt = "menu,menuone,noselect"
opt.undofile = true
opt.wildmenu = true
opt.wildmode = "longest:list,full"
opt.cmdheight = 0
opt.showcmd = false
opt.laststatus = 3
opt.cursorline = true
opt.conceallevel = 0
o.scrolloff = 10

-- Window
opt.splitkeep = "screen"
opt.splitright = true
opt.splitbelow = true

-- Backup
o.backup = false
o.writebackup = false
o.swapfile = false

-- UI
o.showtabline = 0
wo.colorcolumn = "100"
opt.ruler = true

-- Clipboard
opt.clipboard = { "unnamed", "unnamedplus" }

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Chars
opt.list = true
opt.listchars = {
  extends = "❯",
  precedes = "❮",
  trail = "·",
  tab = "»·",
  nbsp = "+",
  -- space = "·",
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
-- Loading slowly
-- opt.spell = true
-- opt.spelllang = { "en_us" }

-- Tab & Indent
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.signcolumn = "yes"

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "gbk", "gb2312" }
-- opt.termencoding = "utf-8"

-- Color
o.pumblend = 0
o.winblend = 0
o.cursorlineopt = "number"
opt.termguicolors = true

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Wildfire
g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "ip", "it", "i`", "i*" }

-- Disable nvim intro
opt.shortmess:append("sI")
