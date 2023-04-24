return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "gbprod/yanky.nvim",
      opts = {
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
        },
        picker = {
          select = {
            action = nil, -- nil to use default put action
          },
          telescope = {
            mappings = nil, -- nil to use default mappings
          },
        },
        system_clipboard = { sync_with_ring = true },
        highlight = { on_put = true, on_yank = true, timer = 500 },
        preserve_cursor_position = { enabled = true },
      },
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        dynamic_preview_title = true,
        mappings = {
          i = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
          n = {
            ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["q"] = require("telescope.actions").close,
          },
        },
        layout_config = { horizontal = { width = 100 } },
      },
      extensions = {
        undo = {
          use_delta = true,
          side_by_side = false,
          layout_strategy = "vertical",
          layout_config = { preview_height = 0.8 },
          diff_context_lines = vim.o.scrolloff,
        },
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          prompt_prefix = "Dirs> ",
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function()
                vim.cmd("normal vbd")
              end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = require("telescope").extensions.file_browser.actions.create,
              ["H"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
              ["D"] = require("telescope").extensions.file_browser.actions.remove,
              ["R"] = require("telescope").extensions.file_browser.actions.rename,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            },
          },
        },
      },
    })
    require("telescope").load_extension("undo")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("yank_history")
  end,
}
