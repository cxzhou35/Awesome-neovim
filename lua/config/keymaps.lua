-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

local keymap = vim.keymap

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move cursor
keymap.set("n", "<S-h>", "^")
keymap.set("n", "<S-j>", "5j")
keymap.set("n", "<S-k>", "5k")
keymap.set("n", "<S-l>", "g_")
keymap.set("v", "<S-h>", "^")
keymap.set("v", "<S-j>", "5j")
keymap.set("v", "<S-k>", "5k")
keymap.set("v", "<S-l>", "g_")

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Buffer select
map("n", "<C-k>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<C-j>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Split window
keymap.set("n", "s", "<nop>")
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Change window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Indent
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
keymap.set("n", "<", "<<")
keymap.set("n", ">", ">>")

-- Number
keymap.set("v", "+", "g<C-a>")
keymap.set("v", "-", "g<C-x>")
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- File
map("n", "<C-n>", "<cmd>enew<cr>", { desc = "New File" })
keymap.set("n", "<C-q>", ":bdelete<CR>")
keymap.set("n", "<S-s>", "<nop>")
keymap.set("n", "fq", ":q!<CR>")
keymap.set("n", "fw", ":wa<CR>")
keymap.set("n", "fwq", ":wqa<CR>")

-- Surround
keymap.set("n", "vw", "vaw")
keymap.set("n", "vp", "vap")
keymap.set("n", "vb", "vab")

-- Yank
keymap.set("n", "yp", "yyp")
keymap.set("n", "yw", "yaw")

-- Carbon
keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true })

-- Wildfire
keymap.set("", "<Space>", "<Plug>(wildfire-fuel)")

-- Telescope
-- keymap.set("n", "<C-f>", function()
--   require("telescope").extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--     respect_gitignore = false,
--     hidden = true,
--     grouped = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 45 },
--   })
-- end)

-- Lspsaga
local opts = { silent = true, noremap = true }

keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts) -- Code Action
keymap.set("n", "ge", "<cmd>Lspsaga lsp_finder<CR>", opts) -- Finder
keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts) -- Rename
keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts) -- Outline
keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- Hover Doc
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek Definition
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- Goto Definition
keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Show line diagnostics
keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Show cursor diagnostic
keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Diagnsotic jump
keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Diagnsotic jump
keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Signature Help
keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true }) -- Format

-- Hop
keymap.set("n", "<leader>h", ":HopWord<CR>", opts)
keymap.set("n", "<leader>1", ":HopChar1<CR>", opts)
keymap.set("n", "<leader>2", ":HopChar2<CR>", opts)
keymap.set("n", "<leader>p", ":HopPattern<CR>", opts)
keymap.set("n", "<leader>l", ":HopLineStart<CR>", opts)
keymap.set("n", "<leader>v", ":HopVertical<CR>", opts)

-- Markdown Preview
keymap.set("", "<C-m>", "<Plug>MarkdownPreviewToggle")

-- Paste image
keymap.set("n", "<leader>pi", ":PasteImg<CR>")
