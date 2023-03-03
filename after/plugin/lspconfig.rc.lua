local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function() vim.lsp.buf.format() end
    })
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        update_in_insert = true,
        virtual_text = {spacing = 2, prefix = "●"},
        severity_sort = true
    })

vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})

-- Diagnostic symbols in the sign column (gutter)
local signs = {Error = " ", Warn = " ", Hint = "ﴞ ", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

vim.diagnostic.config({
    virtual_text = {prefix = '●', source = "if_many"},
    update_in_insert = true,
    float = {
        source = "if_many", -- Or "if_many"
        style = "minimal",
        border = "rounded"
    }
})

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = {"utf-16"}

-- Add language servers
local servers = {
    'clangd', 'rust_analyzer', 'gopls', 'vimls', 'cmake', 'marksman'
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach, capabilities = capabilities}
end

nvim_lsp.lua_ls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- enable_format_on_save(client, bufnr)
    end,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                }
            }
        }
    }
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off"
            }
        }
    }
}

-- nvim_lsp.pylsp.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         pylsp = {
--             plugins = {pyflakes = {enabled = false}, pylint = {enabled = false}}
--         }
--     }
-- }
