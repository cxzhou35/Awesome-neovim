return {
  "L3MON4D3/LuaSnip",
  build = (not jit.os:find("Windows"))
      and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").load({
        paths = { "~/.config/nvim/snippets/friendly-snippets/" },
      })
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  -- config = function()
  --   require("luasnip").config.set_config({
  --     enable_autosnippets = true,
  --     store_selection_keys = "`",
  --   })
  --   require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnip" })
  --   local auto_expand = require("luasnip").expand_auto
  --   require("luasnip").expand_auto = function(...)
  --     vim.o.undolevels = vim.o.undolevels
  --     auto_expand(...)
  --   end
  --
  --   local types = require("luasnip.util.types")
  --   require("luasnip").config.setup({
  --     ext_opts = {
  --       [types.choiceNode] = {
  --         active = {
  --           virt_text = { { "●", "GruvboxOrange" } },
  --         },
  --       },
  --       [types.insertNode] = {
  --         active = {
  --           virt_text = { { "●", "GruvboxBlue" } },
  --         },
  --       },
  --     },
  --   })
  -- end,
  keys = {
    {
      "<A-n>",
      "<Plug>luasnip-next-choice",
      mode = { "i", "s" },
    },
    {
      "<A-p>",
      "<Plug>luasnip-prev-choice",
      mode = { "i", "s" },
    },
  },
}
