return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    notify = false,
    plugins = { spelling = true },
    defaults = {
      {
        mode = { "n", "v" },
        { "<leader>a", group = "terminal" },
        { "<leader>h", group = "hop" },
        { "<leader>r", group = "conda env" },
        { "<leader>t", group = "misc" },
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
