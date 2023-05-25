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
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
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
  pattern = { "gitcommit", "markdown", "tex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- auto sync plugins on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~") .. "/.config/nvim/lua/plugins/",
  callback = ":Lazy sync",
})

-- check spelling in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "tex" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- set filetype to tex for tex files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal filetype=tex",
  group = augroup("tex"),
  pattern = { "*.tex", "*.bbl", "*.bib", "*.texx", "*.texb", "*.cls" },
})

-- auto detect git conflicts
-- vim.api.nvim_create_autocommand("User", {
--   pattern = "GitConflictDetected",
--   callback = function()
--     vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
--     vim.keymap.set("n", "cww", function()
--       engage.conflict_buster()
--       create_buffer_local_mappings()
--     end)
--   end,
-- })
