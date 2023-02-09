local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end,
        bufnr = bufnr
    })
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
    sources = {
        formatting.cmake_format, -- cmake formatting
        formatting.clang_format, -- c/cpp formatting
        -- formatting.astyle, -- c/cpp formatting
        formatting.gofumpt, -- go formatting
        formatting.autopep8, -- python formatting
        formatting.rustfmt, -- rust formatting
        formatting.lua_format -- lua formatting
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function() lsp_formatting(bufnr) end
            })
        end
    end
}

vim.api.nvim_create_user_command('DisableLspFormatting', function()
    vim.api.nvim_clear_autocmds({group = augroup, buffer = 0})
end, {nargs = 0})
