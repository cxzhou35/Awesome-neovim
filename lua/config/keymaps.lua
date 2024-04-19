-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
local opts = { silent = true, noremap = true }

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', { silent = true })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "use 'C-a' to select all" })

-- Move cursor
map({ "n", "v", "o" }, "<S-h>", "^", { desc = "Use 'H' as '^'" })
map({ "n", "v", "o" }, "<S-l>", "g_", { desc = "Use 'L' as 'g_'" })
map({ "n", "v", "o" }, "<S-j>", "7j", { desc = "Quick forward" })
map({ "n", "v", "o" }, "<S-k>", "7k", { desc = "Quick backward" })

-- Disable continuations
map("n", "<Leader>o", "o<Esc>^Da", opts)
map("n", "<Leader>O", "O<Esc>^Da", opts)

-- Lazy
-- BUG: Lazy keymap delete not work now
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy Menu" })

map("n", "<leader>L", function()
  Util.news.changelog()
end, { desc = "LazyVim Changelog" })

-- Buffers
if Util.has("bufferline.nvim") then
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
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
map({ "n", "v", "o" }, "<M-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map({ "n", "v", "o" }, "<M-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map({ "n", "v", "o" }, "<M-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map({ "n", "v", "o" }, "<M-l>", "<C-w>l", { desc = "Go to right window", remap = true })

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
map("n", "<leader>fq", "<cmd>q!<CR>")
map("n", "<leader>fw", "<cmd>wa<CR>")
map("n", "<leader>fwq", "<cmd>wqa<CR>")

-- Surround
map("n", "vw", "vaw")
map("n", "vp", "vap")
map("n", "vb", "vab")

-- Yank
map("n", "yp", "yyp")
map("n", "yw", "yaw")

-- Alternate toggler
map("n", "<leader>at", "<cmd>ToggleAlternate<CR>", { desc = "Toggle Alternate" })

-- Joshuto
map("n", "<leader>ra", "<cmd>Joshuto<cr>", { desc = "Open joshuto in neovim" })

-- Carbon
map("v", "<leader>cn", "<cmd>CarbonNow<CR>", { silent = true, desc = "Carbon Now" })

map("n", "<leader>hw", "<cmd>HopWord<CR>", opts)
map("n", "<leader>h1", "<cmd>HopChar1<CR>", opts)
map("n", "<leader>h2", "<cmd>HopChar2<CR>", opts)
map("n", "<leader>hp", "<cmd>HopPattern<CR>", opts)
map("n", "<leader>hl", "<cmd>HopLineStart<CR>", opts)
map("n", "<leader>hv", "<cmd>HopVertical<CR>", opts)

-- Lspsaga
-- BUG: keymap delete not work now
vim.keymap.del({ "n" }, "K")
map("n", "ga", "<cmd>Lspsaga code_action<CR>", opts) -- Code Action
map("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Finder
map("n", "go", "<cmd>Lspsaga outline<CR>", opts) -- Outline
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- Hover Doc
-- map("n", "<leader>gh", "vim.lsp.buf.hover", opts) -- Hover Doc
map("n", "gt", "<cmd>Lspsaga term_toggle<CR>", opts) -- Float Terminal
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek Definition
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- Goto Definition
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Show line diagnostics
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Diagnsotic jump
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Diagnsotic jump
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Signature Help
map("n", "gb", "<cmd>Telescope diagnostics bufnr=2<CR>", opts) -- show diagnostics for file
map("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

-- Toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })

-- Telescope
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
    layout_config = { height = 32 },
  })
end, { desc = "Telescope File Browser" })

-- Url open
map("n", "gx", "<esc>:URLOpenUnderCursor<cr>", { desc = "Open URL under cursor" })
