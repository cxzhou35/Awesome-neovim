-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local api = vim.api
local g = vim.g

g.mapleader = "\\"
g.maplocalleader = "\\"

opt.iskeyword:append("-")
opt.swapfile = false
opt.backspace = { "start", "eol", "indent" }
opt.relativenumber = false

-- Clipboard
opt.clipboard = { "unnamed", "unnamedplus" }

-- Chars
opt.listchars = { extends = "❯", precedes = "❮", trail = "·", tab = "▸ " }

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

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "gbk", "gb2312" }
opt.termencoding = "utf-8"

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Wildfire
g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "ip", "it", "i`", "i*" }

-- Themes everforest
g.everforest_diagnostic_line_highlight = 1
g.everforest_diagnostic_text_highlight = 1
g.everforest_better_performance = 1
g.everforest_background = "soft"
g.everforest_dim_inactive_windows = 1
g.everforest_transparent_background = 1
g.everforest_ui_contrast = "high"
g.everforest_disable_terminal_colors = 1

-- Themes nord
g.nord_contrast = true
g.nord_borders = true
g.nord_disable_background = true
g.nord_italic = false
g.nord_uniform_diff_background = true
g.nord_bold = true
