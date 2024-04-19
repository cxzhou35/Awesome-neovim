return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
          paths = { "~/.config/nvim/snippets/friendly-snippets/" },
        })
      end,
    },
  },
  keys = {},
}
