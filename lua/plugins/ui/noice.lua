return {
  "folke/noice.nvim",
  keys = { { "<c-f>", false }, { "<c-b>", false } },
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "Toggling hidden files",
      },
      opts = { skip = true },
    })
    opts.commands = {
      all = {
        -- options for the message history that you get with `:Noice`
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    }

    opts.presets.lsp_doc_border = true
    opts.routes.view = "mini"
    opts.cmdline = {
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
    }
  end,
}
