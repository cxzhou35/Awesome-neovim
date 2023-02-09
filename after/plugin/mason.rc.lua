local mason_status, mason = pcall(require, "mason")
if not mason_status then return end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then return end

-- import mason-null-ls plugin safely
local mason_null_ls_status, null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then return end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    PATH = "prepend",
    log_level = vim.log.levels.INFO
})

lspconfig.setup {
    ensure_installed = {
        "clangd", "gopls", "sumneko_lua", "vimls", "jsonls", "pyright"
    },
    automatic_installation = true
}

null_ls.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "cmake_format", -- cmake formatting
        -- "astyle", -- c/cpp formatting
        -- "clang_format", -- c/cpp formatting
        "gofumpt", -- go formatting
        "autopep8", -- python formatting
        "lua_format" -- lua formatting
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true
})
