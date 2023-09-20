return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          notify = false, -- 在某些情况下弹出提示（比如连续两次使用 disableHLChunk 命令）
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = {
            -- { fg = "#806d9c" },
            { fg = "#9079ad" },
            { fg = "#c21f30" }, -- 这个高亮是用来标志错误的代码块
          },
          textobject = "",
          max_file_size = 1024 * 1024,
          error_sign = true,
        },
        indent = {
          enable = true,
          use_treesitter = false,
          chars = {
            "│",
          },
          style = {
            { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
            -- "#7991d1",
            -- "#2578b5",
            -- "#5e90b8",
            -- "#3c5e91",
            -- "#DBE7ED",
            -- "#ADC5CF",
          },
        },
        line_num = {
          enable = false,
          use_treesitter = false,
          style = "#698aab",
        },
        blank = {
          enable = false,
          chars = {
            "․",
          },
          style = {
            vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
          },
        },
      })
    end,
  },
}
