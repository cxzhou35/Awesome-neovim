local status, ns = pcall(require, "nvim-surround")
if (not status) then return end

ns.setup({})
