return {
  "wakatime/vim-wakatime",
  lazy = false,
  keys = {
    { "<leader>rw", "<cmd>WakaTimeToday<cr>", desc = "Show Wakatime Today" },
    { "<leader>rk", "<cmd>WakaTimeApiKey<cr>", desc = "Edit Wakatime Api Key" },
  },
}
