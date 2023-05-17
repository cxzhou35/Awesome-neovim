local M = {}

-- set indent sizes for filetypes
M.set_indent_sizes = function(filetypes)
  for filetype, size in pairs(filetypes) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetype,
      callback = function()
        vim.opt.shiftwidth = size
        vim.opt.tabstop = size
        vim.opt.softtabstop = size
      end,
    })
  end
end

-- auto clean extra output latex files
M.clean = function()
  local current_dir = vim.fn.expand("%:p:h")
  local file_types = {
    "*.aux",
    "*.bbl",
    "*.blg",
    "*.idx",
    "*.ind",
    "*.lof",
    "*.lot",
    "*.out",
    "*.toc",
    "*.acn",
    "*.acr",
    "*.alg",
    "*.glg",
    "*.glo",
    "*.gls",
    "*.ist",
    "*.fls",
    "*.log",
    "*.fdb_latexmk",
  }
  for _, file_type in ipairs(file_types) do
    local file_pattern = current_dir .. "/*." .. file_type
    local command = "silent !rm " .. file_pattern
    vim.cmd(command)
  end
end

return M
