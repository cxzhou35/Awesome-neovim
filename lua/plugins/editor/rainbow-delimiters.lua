return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local rainbow = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      strategy = {
        [""] = rainbow.strategy["global"],
        vim = rainbow.strategy["local"],
      },
    }
  end,
}
