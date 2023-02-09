local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup({
    bin = 'prettier',
    filetypes = {
    "json",
    "markdown",
    "c",
    "cpp",
    "go",
    "lua",
    "python"
    },
    arrow_parens = "always",
    bracket_spacing = true,
})
