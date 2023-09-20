return {
  "glepnir/nerdicons.nvim",
  event = "VeryLazy",
  cmd = "NerdIcons",
  config = function()
    require("nerdicons").setup({
      border = "single", -- Border
      prompt = "󰨭 ", -- Prompt Icon
      preview_prompt = " ", -- Preview Prompt Icon
      width = 0.5, -- flaot window width
      down = "<C-n>", -- Move down in preview
      up = "<C-p>", -- Move up in preview
      copy = "<C-y>", -- Copy to the clipboard
    })
  end,
}
