local state, wildfire = pcall(require, 'wildfire')

if (not state) then return end

vim.g.wildfire_objects = {"i'", 'i"', "i)", "i]", "i}", "ip", "it", "i`", "i*"}
