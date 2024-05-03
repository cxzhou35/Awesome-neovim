local discipline = require("zicx.discipline")

discipline.cowboy()

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
local unmap = vim.keymap.del
local opts = { silent = true, noremap = true }

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', { silent = true })
map({ "n", "v" }, "<leader>y", [["+y]], { silent = true })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]])

-- Jumplist
map("n", "<C-m>", "<C-i>", opts)

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "use 'C-a' to select all" })

-- Move cursor
map({ "n", "v", "o" }, "H", "^", { desc = "Jump to the start of line" })
map({ "n", "v", "o" }, "L", "g_", { desc = "Jump to the end of line" })
map({ "n", "v", "o" }, "J", "7j", { desc = "Quick forward" })
map({ "n", "v", "o" }, "K", "7k", { desc = "Quick backward" })

-- Disable continuations
map("n", "<Leader>o", "o<Esc>^Da", opts)
map("n", "<Leader>O", "O<Esc>^Da", opts)

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
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>h", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab>j", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>k", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

map("n", "s", "<nop>")
-- Split window
map("n", "ss", "<cmd>split<Return><C-w>w", { silent = true, desc = "split" })
map("n", "sv", "<cmd>vsplit<Return><C-w>w", { silent = true, desc = "vsplit" })
map("n", "se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "sq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Navigate window
map({ "n", "v", "o" }, "sh", "<C-w>h", { desc = "Go to left window", remap = true })
map({ "n", "v", "o" }, "sj", "<C-w>j", { desc = "Go to lower window", remap = true })
map({ "n", "v", "o" }, "sk", "<C-w>k", { desc = "Go to upper window", remap = true })
map({ "n", "v", "o" }, "sl", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window
map("n", "s<left>", ":vertical resize +20<cr>")
map("n", "s<right>", ":vertical resize -20<cr>")
map("n", "s<up>", ":resize +10<cr>")
map("n", "s<down>", ":resize -10<cr>")

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
map("n", "<leader>fa", "<cmd>wqa<CR>")

-- Surround
map("n", "vw", "vaw")
map("n", "vp", "vap")
map("n", "vb", "vab")

-- Yank
map("n", "yp", "yyp")
map("n", "yw", "yaw")

------------- Plugins -------------

-- Lazy
-- BUG: Lazy keymap delete not work now
map("n", "<leader>la", "<cmd>Lazy<cr>", { desc = "Lazy Menu" })

map("n", "<leader>L", function()
  Util.news.changelog()
end, { desc = "LazyVim Changelog" })

-- Joshuto
map("n", "<leader>ra", "<cmd>Joshuto<cr>", { desc = "Open joshuto in neovim" })

-- Lspsaga
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

-- Easy Align
map({ "n", "v", "o" }, "ge", "<Plug>(EasyAlign)", { desc = "Easy Align" })
