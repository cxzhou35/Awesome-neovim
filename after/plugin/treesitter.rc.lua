local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    },
    indent = {enable = true, disable = {"python"}},
    ensure_installed = { -- add language server you want here
        "cpp", "rust", "json", "yaml", "markdown", "bash", "lua", "vim", "go",
        "c", "dockerfile", "gitignore"
    },
    autotag = {enable = true},
    auto_install = true,
    sync_install = false,
    rainbow = {enable = true, extended_mode = true, max_file_lines = nil}
}
