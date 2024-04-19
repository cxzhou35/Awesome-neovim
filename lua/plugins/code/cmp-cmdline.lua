return {
  "hrsh7th/cmp-cmdline",
  config = function()
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = {
          c = cmp.mapping.confirm({ select = false }),
        },
      }),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  end,
}
