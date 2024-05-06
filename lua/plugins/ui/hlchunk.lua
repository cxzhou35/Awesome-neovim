return {
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
}
