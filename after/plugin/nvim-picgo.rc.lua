local status, picgo = pcall(require, "nvim-picgo")
if (not status) then return end

picgo.setup({})
