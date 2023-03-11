local status, vimtex = pcall(require, "vimtex")
if not status then
  return
end

-- PDF Viewer:
vim.g["vimtex_view_method"] = "skim"
vim.g["vimtex_quickfix_mode"] = 0

-- Engines
vim.g["vimtex_compiler_latexmk_engines"] = {
  _ = "-xelatex",
  -- pdfdvi = '-pdfdvi',
  -- pdfps = '-pdfps',
  -- pdflatex = '-pdf',
  -- luatex = '-lualatex',
  -- lualatex = '-lualatex',
  -- xelatex = '-xelatex'
}

vim.g["vimtex_compiler_latexrun_engines"] = {
  _ = "-xelatex",
  -- pdfdvi = '-pdfdvi',
  -- pdfps = '-pdfps',
  -- pdflatex = '-pdf',
  -- luatex = '-lualatex',
  -- lualatex = '-lualatex',
  -- xelatex = '-xelatex'
}

-- Ignore mappings
vim.g["vimtex_mappings_enabled"] = 1

-- Auto Indent
vim.g["vimtex_indent_enabled"] = 0

-- Auto Complete
vim.g["vimtex_complete_enabled"] = 0

vim.g["vimtex_quickfix_open_on_warning"] = 0

-- Error Suppression:
-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

vim.g["vimtex_log_ignore"] = {
  "Underfull",
  "Overfull",
  "specifier changed to",
  "Token not allowed in a PDF string",
  "Package Fontspec Warning",
  "LaTeX Font Warning",
}

vim.g["vimtex_context_pdf_viewer"] = 1
vim.g["vimtex_context_pdf_viewer"] = "open -a Skim"

vim.g.conceallevel = 1
vim.g["tex_conceal"] = "abdmg"
-- vim.g['vimtex_compiler_progname'] = 'nvr'
-- vim.g['vimtex_complete_close_braces'] = 1
--
