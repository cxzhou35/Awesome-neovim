local status, notify = pcall(require, "nvim-notify")
if (not status) then return end

notify.setup({
    background_colour = "Normal",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade",
    timeout = 5000,
    top_down = true
})
