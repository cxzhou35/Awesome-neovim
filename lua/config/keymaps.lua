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
map("n", "t", "<Nop>")
map("n", "T", "<Nop>")
map("n", "tl", "<cmd>tablast<cr>", { desc = "Last Tab", silent = true })
map("n", "th", "<cmd>tabfirst<cr>", { desc = "First Tab", silent = true })
map("n", "tj", "<cmd>tabnext<cr>", { desc = "Next Tab", silent = true })
map("n", "tk", "<cmd>tabprevious<cr>", { desc = "Previous Tab", silent = true })
map("n", "tn", "<cmd>tabnew<cr>", { desc = "New Tab", silent = true })
map("n", "tq", "<cmd>tabclose<cr>", { desc = "Close Tab", silent = true })

-- Split window
map("n", "s", "<Nop>")
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
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>`", function()
  require("lazy").profile()
end)

-- Lsp
-- map("n", "<leader>gh", "vim.lsp.buf.hover", opts)
map("n", "<leader>rs", ":LspRestart<CR>", opts)
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

-- Easy Align
map({ "n", "v", "o" }, "ge", "<Plug>(EasyAlign)", { desc = "Easy Align" })
