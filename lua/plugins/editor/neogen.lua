return {
  "danymat/neogen",
  keys = {
    {
      "<leader>nc",
      function()
        require("neogen").generate({})
      end,
      desc = "Neogen Comment",
    },
  },
  opts = { enabled = true, snippet_engine = "luasnip" },
}
