return {
  "rolv-apneseth/tfm.nvim",
  lazy = true,
  keys = {
    {
      "<leader>y",
      function()
        require("tfm").open()
      end,
      desc = "Terminal File Manager",
    },
  },
  opts = {
    file_manager = "yazi",
    enable_cmds = false,
    replace_netrw = true,
    ui = {
      border = "rounded",
    },
  },
}
