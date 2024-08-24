return {
  { "gcmt/wildfire.vim" },
  {
    "rmagatti/alternate-toggler",
    keys = {
      { "<leader>i", "<cmd>ToggleAlternate<CR>", desc = "Toggle Alternate" },
    },
    opts = {
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["yes"] = "no",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["=="] = "!=",
      },
    },
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "max397574/better-escape.nvim", event = "InsertEnter", opts = { timeout = 100 } },
  {
    "LunarVim/bigfile.nvim",
    opts = {
      filesize = 10,
      pattern = { "*" },
      features = { -- features to disable
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    },
  },
  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    keys = {
      { "gx", "<esc>:URLOpenUnderCursor<cr>", desc = "Open URL under cursor" },
    },
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "axieax/urlview.nvim",
    cmd = { "UrlView" },
    event = "VeryLazy",
    keys = {
      { mode = { "n" }, "<leader>ru", "<cmd>UrlView<cr>", desc = "View buffer URLs" },
      { mode = { "n" }, "<leader>rp", "<cmd>UrlView packer<cR>", desc = "View Packer plugin URLs" },
    },
    opts = {
      default_picker = "telescope",
    },
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>tm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
  },
}
