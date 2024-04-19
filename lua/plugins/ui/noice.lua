return {
  "folke/noice.nvim",
  keys = { { "<c-f>", false }, { "<c-b>", false } },
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = {
          kind = "search",
          pattern = "^/",
          icon = "🔍 ",
          lang = "regex",
        },
        search_up = {
          kind = "search",
          pattern = "^%?",
          icon = "🔍 ",
          lang = "regex",
        },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
        input = {}, -- Used by input()
      },
    },
  },
}
