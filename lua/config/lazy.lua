local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "catppucin",
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },

    -- import/override with your plugins
    { import = "plugins.colorscheme" },
    { import = "plugins.code" },
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.lang" },
    { import = "plugins.utils" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "catppucin", "habamax" } },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  change_detection = {
    enabled = true,
    notify = false,
  },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zip",
        "zipPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "logiPat",
        "rrhelper",
        "health",
        "matchit",
        "matchparen",
      },
    },
  },
  debug = false,
})
