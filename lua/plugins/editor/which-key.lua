return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["<leader>a"] = { name = "+toggle" },
      ["<leader>h"] = { name = "+hop" },
      ["<leader>r"] = { name = "+misc" },
      ["<leader>t"] = { name = "+terminal" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
