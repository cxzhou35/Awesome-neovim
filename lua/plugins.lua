local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

packer.startup(function(use)
  -- Plugin
  use("wbthomason/packer.nvim")

  -- Greeter
  use("goolord/alpha-nvim")

  -- Themes
  use("shaunsingh/nord.nvim") -- Theme: Nord
  use("EdenEast/nightfox.nvim") -- Theme: Nightfox
  use("sainnhe/everforest") -- Theme: Everforest

  -- Windows
  use({
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
  })

  -- Appearance
  use("yamatsum/nvim-cursorline") -- Cursor Line
  use("akinsho/nvim-bufferline.lua") -- Buffer Line
  use("tjdevries/colorbuddy.nvim")
  use("kyazdani42/nvim-web-devicons") -- File Icons
  use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
  use("lukas-reineke/indent-blankline.nvim")
  use("ellisonleao/carbon-now.nvim") -- Carbon api for neovim

  -- Airline
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'

  -- Lualine
  use("nvim-lualine/lualine.nvim") -- Statusline
  use("justinhj/battery.nvim") -- Show battery in statusline

  -- Utilities
  use("nvim-lua/plenary.nvim") -- Common Utilities
  use("windwp/nvim-autopairs")
  use("norcalli/nvim-colorizer.lua") -- Select Color
  use("gcmt/wildfire.vim") -- Select Content
  use("numToStr/Comment.nvim") -- Comment
  use("Pocco81/HighStr.nvim")
  use("p00f/nvim-ts-rainbow") -- Rainbow Parentheses
  use("folke/todo-comments.nvim") -- VScode like todo highlights
  use("nacro90/numb.nvim") -- Better numline preview
  use("gbprod/yanky.nvim") -- Better yank and put functionalities
  use("rmagatti/alternate-toggler") -- Toggling alternate "boolean" values.
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })
  use("Xuyuanp/scrollbar.nvim") -- Show Scrollbar
  use("mawkler/modicator.nvim") -- Highlight cursor line number
  use({
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
  })
  use({
    "abecodes/tabout.nvim", -- Tab Jump
    wants = { "nvim-treesitter" }, -- or require if not used so far
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  })
  use("folke/which-key.nvim") -- whick-key support for neovim

  -- Notify UIs
  use({
    "folke/noice.nvim",
    requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  })

  -- Bookmarks
  use("MattesGroeger/vim-bookmarks")
  use("tom-anders/telescope-vim-bookmarks.nvim")
  use({ "dhruvmanila/telescope-bookmarks.nvim", tag = "*" }) -- Open browser bookmarks right from neovim

  -- LSP
  use("neovim/nvim-lspconfig") -- LSP
  use("glepnir/lspsaga.nvim") -- LSP UIs
  use("onsails/lspkind-nvim") -- Vscode-like Pictograms
  use("folke/lsp-colors.nvim") -- LSP Color
  use("folke/trouble.nvim") -- Display LSP diagnostics

  -- Mason
  use("williamboman/mason.nvim") -- Manage LSP Server
  use("williamboman/mason-lspconfig.nvim")
  use("jay-babu/mason-null-ls.nvim")

  -- CMP
  use("hrsh7th/nvim-cmp") -- Completion
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")

  -- Undotree
  use("mbbill/undotree")

  -- Formatter
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client

  -- Snippets
  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- Syntax Highlight
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use("debugloop/telescope-undo.nvim")

  -- LaTeX
  use("lervag/vimtex")

  -- Markdown
  use("godlygeek/tabular")
  use({ "plasticboy/vim-markdown", ft = "markdown" }) -- Markdown Support
  use({ "askfiy/nvim-picgo", ft = "markdown" }) -- Picgo
  use("ekickx/clipboard-image.nvim") -- Paste image from clipboard
  use("dkarter/bullets.vim") -- Better list
  use("dhruvasagar/vim-table-mode") -- Better Table
  use("lukas-reineke/headlines.nvim") -- Headlines Highlight
  use({
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  -- Code runner
  use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim") -- For git blame & browse
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({
    "kyazdani42/nvim-tree.lua", -- Nvim Tree
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })
end)
