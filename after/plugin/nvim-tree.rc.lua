local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

-- recommended settings for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local function tab_win_closed(winnr)
  local api = require("nvim-tree.api")
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w)
    return w ~= winnr
  end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else -- else closed buffer was normal buffer
    if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
        vim.schedule(function()
          if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
            vim.cmd("quit") -- then close all of vim
          else -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true,
})

nvim_tree.setup({
  view = {
    adaptive_size = true,
    width = 24,
    mappings = { list = { { key = "u", action = "dir_up" } } },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = { hint = "", info = "", warning = "", error = "" },
  },
  renderer = {
    group_empty = false,
    highlight_git = false,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = { corner = "└", edge = "│", item = "│", none = " " },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = { file = true, folder = true, folder_arrow = true, git = true },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  -- actions = {open_file = {quit_on_open = true}}, -- auto close nvim-tree when open file
  update_focused_file = { enable = true, update_cwd = true },
  filters = {
    dotfiles = false,
    custom = { "^.git$", "^node_modules$", "^.DS_Store$" },
  },
  log = { enable = true, types = { diagnostics = true } },
  sort_by = "case_sensitive",
  hijack_directories = { enable = true, auto_open = true },
})
