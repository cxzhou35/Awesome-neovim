-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', { silent = true })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "use 'C-a' to select all" })

-- Move cursor
map({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
map({ "n", "v", "o" }, "L", "g_", { desc = "Use 'L' as 'g_'" })
map({ "n", "v", "o" }, "J", "5j", { desc = "Use 'J' as '5j'" })
map({ "n", "v", "o" }, "K", "5k", { desc = "Use 'K' as '5k'" })

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Lazy menu
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Buffer select
map("n", "<C-k>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<C-j>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Split window
map("n", "s", "<nop>")
map("n", "<leader>sh", "<cmd>split<Return><C-w>w", { silent = true, desc = "split" })
map("n", "<leader>sv", "<cmd>vsplit<Return><C-w>w", { silent = true, desc = "vsplit" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Change window
map({ "n", "v", "o" }, "sh", "<C-w>h")
map({ "n", "v", "o" }, "sk", "<C-w>k")
map({ "n", "v", "o" }, "sj", "<C-w>j")
map({ "n", "v", "o" }, "sl", "<C-w>l")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<", "v<g")
map("n", ">", "v>g")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", " ", " <c-g>u")

-- Number
map("v", "+", "g<C-a>")
map("v", "-", "g<C-x>")
map("n", "<leader>+", "<C-a>")
map("n", "<leader>-", "<C-x>")

-- File
map("n", "<C-n>", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-q>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
map("n", "<S-s>", "<nop>")
map("n", "fq", "<cmd>q!<CR>")
map("n", "fw", "<cmd>wa<CR>")
map("n", "fwq", "<cmd>wqa<CR>")

-- Surround
map("n", "vw", "vaw")
map("n", "vp", "vap")
map("n", "vb", "vab")

-- Yank
map("n", "yp", "yyp")
map("n", "yw", "yaw")

-- Carbon
map("v", "<leader>cn", "<cmd>CarbonNow<CR>", { silent = true, desc = "Carbon Now" })

-- Wildfire
map("", "<cr>", "<Plug>(wildfire-fuel)")

-- Alternate toggler
map("n", "<leader>at", "<cmd>ToggleAlternate<CR>", { desc = "Toggle Alternate" })

-- Lspsaga
local opts = { silent = true, noremap = true }

map("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)              -- Code Action
map("n", "gf", "<cmd>Lspsaga finder<CR>", opts)                   -- Finder
-- map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)                   -- Rename
map("n", "go", "<cmd>Lspsaga outline<CR>", opts)                  -- Outline
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)                -- Hover Doc
map("n", "gt", "<cmd>Lspsaga term_toggle<CR>", opts)              -- Float Terminal
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)          -- Peek Definition
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)          -- Goto Definition
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)    -- Show line diagnostics
-- map("n", "gS", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Show cursor diagnostic
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)     -- Diagnsotic jump
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)     -- Diagnsotic jump
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Signature Help

-- Hop
map("n", "<leader>hw", "<cmd>HopWord<CR>", opts)
map("n", "<leader>h1", "<cmd>HopChar1<CR>", opts)
map("n", "<leader>h2", "<cmd>HopChar2<CR>", opts)
map("n", "<leader>hp", "<cmd>HopPattern<CR>", opts)
map("n", "<leader>hl", "<cmd>HopLineStart<CR>", opts)
map("n", "<leader>hv", "<cmd>HopVertical<CR>", opts)

-- Resize window using arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Lazygit
map("n", "<C-l>", function()
  Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gl", function()
  Util.float_term({ "lazygit" }, { esc_esc = false })
end, { desc = "Lazygit (cwd)" })

-- Joshuto
map("n", "<C-r>", "<cmd>Joshuto<cr>", { desc = "Open joshuto in neovim" })

-- Markdown
map("n", "<C-m>", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview" })

-- Oil file manager
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- NerdIcons
map("n", "<leader>ni", "<cmd>NerdIcons<CR>", { desc = "NerdIcons" })

-- Telescope
local builtin = require("telescope.builtin")

map("n", ";f", function()
  builtin.find_files({ no_ignore = false, hidden = true })
end, { silent = true, desc = "Telescope Find Files" })
map("n", ";r", function()
  builtin.live_grep()
end, { silent = true, desc = "Telescope Live Grep" })
map("n", ";b", function()
  builtin.buffers()
end, { silent = true, desc = "Telescope Buffers" })
map("n", ";o", function()
  builtin.oldfiles()
end, { silent = true, desc = "Telescope Old Files" })
map("n", ";e", function()
  builtin.diagnostics()
end, { silent = true, desc = "Telescope Diagnostics" })
map("n", ";c", function()
  builtin.colorscheme()
end, { silent = true, desc = "Telescope Colorscheme" })
map("n", ";l", function()
  builtin.reloader()
end, { silent = true, desc = "Telescope Reloader" })
map("n", ";k", function()
  builtin.keymaps()
end, { silent = true, desc = "Telescope keymaps" })

map("n", ";t", "<cmd>TodoTelescope<CR>", { silent = true, desc = "Telescope Todos" })
map("n", ";u", "<cmd>Telescope undo<CR>", { silent = true, desc = "Telescope Undo" })
map("n", ";y", "<cmd>Telescope yank_history<CR>", { silent = true, desc = "Telescope Yank History" })

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

map("n", "<C-f>", function()
  require("telescope").extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end, { desc = "Telescope File Browser" })

map("n", "<leader>ce", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "ChatGpt Edit With Instructions" })
