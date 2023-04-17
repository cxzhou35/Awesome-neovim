local status, windows = pcall(require, "windows")
if not status then
  return
end

windows.setup({
  autowidth = {
    enable = false,
    winwidth = 3,
    filetype = {
      help = 2,
    },
  },
  ignore = {
    buftype = { "quickfix" },
    filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
  },
  animation = {
    enable = true,
    duration = 300,
    fps = 30,
    easing = "in_out_sine",
  },
})
