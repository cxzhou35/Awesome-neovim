local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function getWords() return tostring(vim.fn.wordcount().chars) end

-- Battery
require"battery".setup({
    show_plugged_icon = true,
    show_unplugged_icon = true,
    show_percent = true
})
local nvim_battery = {
    function() return require("battery").get_status_line() end
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {statusline = 1000, tabline = 1000, winbar = 1000},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 3, -- 0 = just filename, 1 = relative path, 2 = absolute path
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]' -- Text to show for newly created file before first write
                }
            }
        },
        lualine_c = {
            {
                'diagnostics',
                sources = {"nvim_diagnostic"},
                colored = true,
                update_in_insert = false,
                always_visible = false,
                symbols = {
                    error = ' ',
                    warn = ' ',
                    info = ' ',
                    hint = ' '
                }
            }, 'encoding', {'filetype', colored = true}, 'fileformat'
        },
        lualine_x = {'branch'},
        lualine_y = {
            'os.date("%I:%M:%S", os.time())', nvim_battery, getWords, 'progress'
        },
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}

-- Turn off lualine inside nvim-tree
vim.cmd [[
  au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]]

-- Trigger rerender of status line every second for clock
if _G.Statusline_timer == nil then
    _G.Statusline_timer = vim.loop.new_timer()
else
    _G.Statusline_timer:stop()
end
_G.Statusline_timer:start(0, 1000, vim.schedule_wrap(
                              function() vim.api.nvim_command('redrawstatus') end))
