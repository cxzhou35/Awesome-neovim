return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "marksman" })
      -- vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = { settings = { markdown = {} } },
      },
    },
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    -- event = "VeryLazy",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<F5>",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.g.mkdp_browser = vim.g.browser
      vim.g.mkdp_auto_close = 1
      vim.cmd([[do FileType]])
    end,
  },
  {
    "junegunn/vim-easy-align",
    lazy = true,
    -- event = "VeryLazy",
    ft = { "markdown", "tex" },
    cmd = { "EasyAlign" },
  },
  {
    {
      "dfendr/clipboard-image.nvim",
      lazy = true,
      -- event = "VeryLazy",
      opts = {
        -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
        -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
        -- Missing options from `markdown` field will be replaced by options from `default` field
        markdown = {
          img_dir = { "assets", "img" },
          img_dir_txt = "./assets/img",
          img_handler = function(img)
            vim.cmd("normal! f[") -- go to [
            vim.cmd("normal! a" .. img.name) -- append text with image name
          end,
        },
        tex = {
          affix = "\\begin{figure}[htbp]\n\\centering\n\\includegraphics[width=0.5\\textwidth]{%s}\n\\caption{}\n\\label{fig:}\n\\end{figure}",
        },
      },
      ft = { "tex", "markdown" },
      keys = {
        { "<leader>ri", "<cmd>PasteImg<cr>", desc = "Paste image" },
      },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    lazy = true,
    -- event = "VeryLazy",
    ft = { "markdown" },
    opts = {
      markdown = {
        headline_highlights = { "Height" },
        bullets = {},
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = false,
        fat_headline_upper_string = "▃ ",
        fat_headline_lower_string = "🬂 ",
      },
    },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
}
