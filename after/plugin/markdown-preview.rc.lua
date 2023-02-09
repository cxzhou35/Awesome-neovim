local state, mp = pcall(require, 'markdown-preview')
if (not state) then return end

mp.setup({})
