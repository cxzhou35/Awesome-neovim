return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    { "rafamadriz/friendly-snippets" },
    { "saadparwaiz1/cmp_luasnip" },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        LazyVim.lsp.on_attach(function(client)
          if client.name == "copilot" then
            copilot_cmp._on_insert_enter({})
          end
        end)
      end,
    },
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    -- cmp cmdline config
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    return {
      auto_brackets = {}, -- configure any filetype to auto add brackets
      preselect = cmp.PreselectMode.None,
      completion = {
        completeopt = "menu,menuone,noinsert,preview",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true, -- default:true
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "copilot", group_index = 1, priority = 100 },
        -- { name = "snippets" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
        maxwidth = 80,
        ellipsis_char = "...",
      },
      experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      },
    }
  end,
}
-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     version = false, -- last release is way too old
--     event = "InsertEnter",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       {
--         "zbirenbaum/copilot-cmp",
--         dependencies = "copilot.lua",
--         opts = {},
--         config = function(_, opts)
--           local copilot_cmp = require("copilot_cmp")
--           copilot_cmp.setup(opts)
--           -- attach cmp source whenever copilot attaches
--           -- fixes lazy-loading issues with the copilot cmp source
--           LazyVim.lsp.on_attach(function(client)
--             if client.name == "copilot" then
--               copilot_cmp._on_insert_enter({})
--             end
--           end)
--         end,
--       },
--     },
--     opts = function()
--       vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
--       local cmp = require("cmp")
--       local defaults = require("cmp.config.default")()
--       return {
--         auto_brackets = {}, -- configure any filetype to auto add brackets
--         completion = {
--           completeopt = "menu,menuone,noinsert",
--         },
--         window = {
--           completion = cmp.config.window.bordered(),
--           documentation = cmp.config.window.bordered(),
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "path" },
--         }, {
--           { name = "buffer" },
--         }),
--         formatting = {
--           format = function(_, item)
--             local icons = require("lazyvim.config").icons.kinds
--             if icons[item.kind] then
--               item.kind = icons[item.kind] .. item.kind
--             end
--             return item
--           end,
--         },
--         experimental = {
--           ghost_text = {
--             hl_group = "CmpGhostText",
--           },
--         },
--         sorting = defaults.sorting,
--       }
--     end,
--     ---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
--     config = function(_, opts)
--       for _, source in ipairs(opts.sources) do
--         source.group_index = source.group_index or 1
--       end
--       local cmp = require("cmp")
--       cmp.setup(opts)
--       cmp.event:on("confirm_done", function(event)
--         if vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
--           LazyVim.cmp.auto_brackets(event.entry)
--         end
--       end)
--       cmp.event:on("menu_opened", function(event)
--         LazyVim.cmp.add_missing_snippet_docs(event.window)
--       end)
--     end,
--   },
-- }
