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
  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
    },
    config = function()
      local autolist = require("autolist")
      autolist.setup()

      local function mapping_hook(mode, mapping, hook, alias)
        local additional_function = nil
        local maps = vim.api.nvim_get_keymap(mode)
        for _, map in ipairs(maps) do
          if map.lhs == mapping then
            if map.rhs then
              additional_function = map.rhs:gsub("^v:lua%.", "", 1)
            else
              additional_function = map.callback
            end
            pcall(vim.keymap.del, mode, mapping)
          end
        end
        vim.keymap.set(mode, mapping, function(motion)
          local additional_map = nil
          if additional_function then
            if type(additional_function) == "string" then
              local ok, res = pcall(load("return " .. additional_function))
              if ok then
                additional_map = res or ""
              end
            else
              additional_map = additional_function() or ""
            end
          end
          return hook(motion, additional_map or mapping) or ""
        end, { expr = true, buffer = true })
      end

      mapping_hook("i", "<CR>", autolist.new)
      mapping_hook("n", "o", require("autolist").new)
      mapping_hook("i", "<Tab>", autolist.indent)
      mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
      mapping_hook("n", "O", autolist.new_before)
      mapping_hook("n", ">>", autolist.indent)
      mapping_hook("n", "<<", autolist.indent)
      mapping_hook("n", "<leader>rl", autolist.force_recalculate)
    end,
    dependencies = {
      {
        "windwp/nvim-autopairs",
        config = true,
        event = "VeryLazy",
      },
    },
  },
}
