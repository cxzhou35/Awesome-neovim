-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', { silent = true })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "use 'C-a' to select all" })

-- Move cursor
map({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
map({ "n", "v", "o" }, "L", "g_", { desc = "Use 'L' as 'g_'" })
map({ "n", "v", "o" }, "J", "5j", { desc = "Quick j move" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>L", function()
  Util.news.changelog()
end, { desc = "LazyVim Changelog" })

-- Buffers
if Util.has("bufferline.nvim") then
  map("n", "<leader>1", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<leader>2", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<leader>1", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<leader>2", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Tabs
map("n", "<tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<tab>h", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<tab>j", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<tab>k", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- Split window
map("n", "<leader>wh", "<cmd>split<Return><C-w>w", { silent = true, desc = "split" })
map("n", "<leader>wv", "<cmd>vsplit<Return><C-w>w", { silent = true, desc = "vsplit" })
map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Change window
map("n", "s", "<nop>")
map({ "n", "v", "o" }, "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map({ "n", "v", "o" }, "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map({ "n", "v", "o" }, "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map({ "n", "v", "o" }, "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

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

-- map("n", "gh", "vim.lsp.buf.hover", opts)                         -- Hover Doc
map("n", "ga", "<cmd>Lspsaga code_action<CR>", opts) -- Code Action
map("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Finder
map("n", "go", "<cmd>Lspsaga outline<CR>", opts) -- Outline
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- Hover Doc
map("n", "gt", "<cmd>Lspsaga term_toggle<CR>", opts) -- Float Terminal
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek Definition
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- Goto Definition
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Show line diagnostics
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Diagnsotic jump
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Diagnsotic jump
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Signature Help
map("n", "gb", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file
map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
map("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

-- Hop
map("n", ";w", "<cmd>HopWord<CR>", opts)
map("n", ";1", "<cmd>HopChar1<CR>", opts)
map("n", ";2", "<cmd>HopChar2<CR>", opts)
map("n", ";p", "<cmd>HopPattern<CR>", opts)
map("n", ";l", "<cmd>HopLineStart<CR>", opts)
map("n", ";v", "<cmd>HopVertical<CR>", opts)

-- Resize window using arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Lazygit
map("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
  Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- Joshuto
map("n", "<C-r>", "<cmd>Joshuto<cr>", { desc = "Open joshuto in neovim" })

-- Terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Markdown
map("n", "<C-m>", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview" })

-- Oil file manager
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- NerdIcons
map("n", "<leader>ni", "<cmd>NerdIcons<CR>", { desc = "NerdIcons" })

-- Calngd
map("n", "<leader>ci", "<cmd>ClangdToggleInlayHints<CR>", { desc = "Calngd Toggle Inlay Hints" })

-- Formatting
-- map({ "n", "v" }, "<leader>cf", function()
--   Util.format({ force = true })
-- end, { desc = "Format" })

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
-- map("n", ";l", function()
--   builtin.reloader()
-- end, { silent = true, desc = "Telescope Reloader" })
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
