local status, cmp = pcall(require, "cmp")
if (not status) then return end
local luasnip = require("luasnip")

-- local has_words_before = function()
--     unpack = unpack or table.unpack
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and
--                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
--                                                                           col)
--                    :match("%s") == nil
-- end

-- all message
local cmpFormat1 = function(entry, vim_item)
    -- fancy icons and a name of kind
    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " ..
                        vim_item.kind
    -- set a name for each source
    vim_item.menu = ({
        luasnip = "[Snippets]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TabNine]",
        buffer = "[Buffer]",
        look = "[Look]",
        path = "[Path]"
    })[entry.source.name]
    return vim_item
end

-- -- short message
-- local cmpFormat2 = function(entry, vim_item)
--     vim_item.kind = lspkind.presets.default[vim_item.kind]
--     return vim_item
-- end

local keymap = require("cmp.utils.keymap")
cmp.confirm = function(option)
    option = option or {}
    local e = cmp.core.view:get_selected_entry() or
                  (option.select and cmp.core.view:get_first_entry() or nil)
    if e then
        cmp.core:confirm(e, {behavior = option.behavior}, function()
            local myContext = cmp.core:get_context({
                reason = cmp.ContextReason.TriggerOnly
            })
            cmp.core:complete(myContext)

            if e and e.resolved_completion_item and
                (e.resolved_completion_item.kind == 3 or
                    e.resolved_completion_item.kind == 2) then
                vim.api.nvim_feedkeys(keymap.t("()<Left>"), "n", true)
            end
        end)
        return true
    else
        if vim.fn.complete_info({"selected"}).selected ~= -1 then
            keymap.feedkeys(keymap.t("<C-y>"), "n")
            return true
        end
        return false
    end
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-expand-or-jump", true, true,
                                    true), "")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-jump-prev", true, true, true),
                                "")
            else
                fallback()
            end
        end
    },
    sources = {
        {
            name = 'nvim_lsp',
            entry_filter = function(entry)
                return
                    require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~=
                        'Text'
            end
        }, {
            name = "luasnip",
            option = {use_show_condition = true, show_autosnippets = true}
        }, {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        }, -- {name = "look"},
        {name = "path"}
    },
    formatting = {fields = {"kind", "abbr", "menu"}, format = cmpFormat1},
    experimental = {ghost_text = true}
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
