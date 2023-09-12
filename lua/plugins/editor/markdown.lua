return {
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    lazy = true,
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_json_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
    end,
  },
  {
    "ekickx/clipboard-image.nvim",
    ft = { "markdown", "tex" },
    keys = {
      { "<leader>pi", "<cmd>PasteImg<cr>", desc = "Paste image" },
    },
  },
  opts = {
    default = {
      img_dir = "assets",
      img_name = function()
        return os.date("%Y-%m-%d-%H-%M-%S")
      end, -- Example result: "2021-04-13-10-04-18"
      affix = "<\n  %s\n>", -- Multi lines affix
    },
    -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
    -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
    -- Missing options from `markdown` field will be replaced by options from `default` field
    markdown = {
      img_dir = "asserts", -- Use table for nested dir (New feature form PR #20)
      img_dir_txt = "./asserts",
      img_handler = function(img) -- New feature from PR #22
        local script = string.format('./image_compressor.sh "%s"', img.path)
        os.execute(script)
      end,
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = "markdown",
    lazy = true,
    opts = {
      markdown = {
        -- Only use for Nord Theme
        -- headline_highlights = {
        --     "Headline1", "Headline2", "Headline3", "Headline4", "Headline5",
        --     "Headline6"
        -- },
        headline_highlights = { "Height" },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = false,
        fat_headline_upper_string = "▃ ",
        fat_headline_lower_string = "🬂 ",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_json_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
    end,
  },
  {
    "AckslD/nvim-FeMaco.lua",
    config = true,
    ft = "markdown",
    keys = {
      { "<leader>fp", "<cmd>FeMaco<cr>", desc = "FeMaco preview" },
    },
  },
}
