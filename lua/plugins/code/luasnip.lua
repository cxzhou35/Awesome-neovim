return {
  "L3MON4D3/LuaSnip",
  build = (not jit.os:find("Windows"))
      and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      -- require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").load({
        paths = { "~/.config/nvim/snippets/friendly-snippets/" },
      })
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  keys = function()
    return {}
  end,
}
