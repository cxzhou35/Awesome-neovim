local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "python" } },
  context_commentstring = { enable = true, enable_autocmd = false },
  ensure_installed = { -- add language server you want here
    "c",
    "cpp",
    "rust",
    "json",
    "yaml",
    "markdown",
    "bash",
    "lua",
    "vim",
    "go",
    "gitignore",
    "latex",
  },
  autotag = { enable = true },
  auto_install = true,
  sync_install = false,
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { "jsx", "cpp" },
    -- Which query to use for finding delimiters
    query = "rainbow-parens",
    -- Highlight the entire buffer all at once
    extended_mode = true,
  },
})
