-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
    "Outline",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Disable ufo fold
-- See https://github.com/kevinhwang91/nvim-ufo/issues/33#issuecomment-1664656433
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "outline",
    "neo-tree",
    "notify",
    "noice",
    "lspinfo",
    "help",
    "man",
    "startuptime",
    "checkhealth",
    "Trouble",
    "sagaoutline",
    "Outline",
  },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = {
    "gitcommit",
    "markdown",
    "tex",
  },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- auto sync plugins on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~") .. "/.config/nvim/lua/plugins/",
  callback = ":Lazy sync",
})

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "gitcommit",
    "markdown",
    "tex",
    "cu",
  },
  callback = function()
    vim.b.autoformat = false
    vim.opt_local.spell = true
  end,
})

-- set filetype to tex for tex files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal filetype=tex",
  group = augroup("tex"),
  pattern = {
    "*.tex",
    "*.bbl",
    "*.bib",
    "*.texx",
    "*.texb",
    "*.cls",
  },
})

-- fix treesitter slow on very big files
local cmp = require("cmp")
local default_cmp_sources = cmp.config.sources({
  { name = "nvim_lsp", keyword_length = 2 },
  { name = "luasnip", keyword_length = 2 },
  { name = "buffer", keyword_length = 2 },
  { name = "path", keyword_length = 2 },
  { name = "nvim_lua", keyword_length = 2 },
})

local bufIsBig = function(bufnr)
  local max_filesize = 100 * 1024 -- 100 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
  if ok and stats and stats.size > max_filesize then
    return true
  else
    return false
  end
end

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(t)
    local sources = default_cmp_sources
    if not bufIsBig(t.buf) then
      sources[#sources + 1] = { name = "treesitter", group_index = 2 }
    end
    cmp.setup.buffer({
      sources = sources,
    })
  end,
})
