local opt = vim.opt
local wo = vim.wo
local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = " "

-- General
o.scrolloff = 10
opt.confirm = true
opt.autowrite = true
opt.iskeyword:append("-")
opt.backspace = { "start", "eol", "indent" }
opt.completeopt = "menu,menuone,noselect"
opt.wildmenu = true
opt.wildmode = "longest:list,full"
opt.laststatus = 3
opt.conceallevel = 2

-- Window
opt.title = true
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen"

-- Backup
o.backup = false
o.writebackup = false
o.swapfile = false
opt.undofile = false

-- UI
o.showtabline = 0
wo.colorcolumn = "100"
opt.cmdheight = 0
opt.wrap = false
opt.showcmd = false
opt.showmode = false
opt.cursorline = true
opt.ruler = true
opt.number = true
opt.relativenumber = false

-- Clipboard
-- opt.clipboard = { "unnamed", "unnamedplus" }
opt.clipboard = "unnamedplus"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.hlsearch = false

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
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftround = true
opt.signcolumn = "yes"
opt.inccommand = "split"

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

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Wildfire
g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "ip", "it", "i`", "i*" }
opt.wildignore:append({ ".aux", ".out", ".toc" })
opt.wildignorecase = true

-- Disable nvim intro
opt.shortmess:append("sI")
