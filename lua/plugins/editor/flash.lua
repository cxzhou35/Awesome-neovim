return {

  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", false },
    { "S", false },
    {
      "fj",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "fr",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "fw",
      function()
        require("flash").jump({
          pattern = vim.fn.expand("<cword>"),
        })
      end,
      desc = "Flash with the word under the cursor",
    },
  },
  opts = {
    modes = {
      search = {
        enabled = false,
      },
      char = { jump_labels = true },
      treesitter_search = {
        label = {
          rainbow = { enabled = true },
        },
      },
    },
  },
}
