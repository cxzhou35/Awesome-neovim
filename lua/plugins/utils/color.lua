return {
  "norcalli/nvim-colorizer.lua",
  -- event = "VeryLazy",
  event = "BufRead",
  config = function()
    require("colorizer").setup({})
  end,
}
