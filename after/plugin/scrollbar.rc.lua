local status, scrollbar = pcall(require, 'scrollbar')
if (not status) then return end

local set = vim.g
set.scrollbar_max_size = 5
set.scrollbar_min_size = 3
set.scrollbar_right_offset = 1
set.scrollbar_width = 1

vim.cmd([[
    augroup ScrollbarInit
      autocmd!
      autocmd WinScrolled,VimResized,QuitPre           * silent! lua require('scrollbar').show()
      autocmd WinEnter,FocusGained                     * silent! lua require('scrollbar').show()
      autocmd WinLeave,BufLeave,BufWinLeave,FocusLost  * silent! lua require('scrollbar').clear()
    augroup end
]])
