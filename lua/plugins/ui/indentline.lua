return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "neogitstatus",
          "lazyterm",
          "txt",
        },
      },
    },
    main = "ibl",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        -- experimental
        context = {
          enable = false,
          use_treesitter = false,
          chars = {
            "┃", -- Box Drawings Heavy Vertical
          },
        },
        chunk = {
          enable = true,
          notify = false,
          use_treesitter = false,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          textobject = "",
          max_file_size = 1024 * 1024,
          error_sign = true,
        },
        indent = {
          enable = true,
          use_treesitter = true,
          chars = {
            -- "│",
            "¦",
            -- "┆",
            -- "┊",
          },
          -- style = {
          -- "#8B81C3",
          -- },
        },
        line_num = {
          enable = false,
          use_treesitter = false,
          style = "#806d9c",
        },
        blank = {
          enable = false,
          use_treesitter = true,
          chars = {
            "․",
          },
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "LazyFile",
    opts = {
      draw = {
        delay = 50,
        animation = function(s, n)
          return 20
        end,
      },
      -- symbol = "▏",
      symbol = "╎",
      -- symbol = "┆",
      options = { border = "both", try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
