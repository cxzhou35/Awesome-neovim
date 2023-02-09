local status, cursorline = pcall(require, "nvim-cursorline")
if (not status) then return end

cursorline.setup {
  cursorline = {
    enable = false,
    timeout = 1000,
    number =true ,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
