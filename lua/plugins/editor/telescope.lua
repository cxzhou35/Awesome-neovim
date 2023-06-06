return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "gbprod/yanky.nvim",
      enabled = true,
      event = { "VeryLazy" },
      opts = {
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
        },
        system_clipboard = { sync_with_ring = true },
        highlight = { on_put = true, on_yank = true, timer = 300 },
        preserve_cursor_position = { enabled = true },
      },
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = string.format("%s ", ""),
        selection_caret = string.format("%s ", ""),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        dynamic_preview_title = true,
        mappings = {
          i = {
            ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["esc"] = require("telescope.actions").close,
          },
          n = {
            ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["q"] = require("telescope.actions").close,
          },
        },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.52,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          -- preview_cutoff = 120,
        },
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
          cwd_to_path = false,
          grouped = false,
          files = true,
          add_dirs = true,
          depth = 1,
          auto_depth = false,
          select_buffer = false,
          hidden = { file_browser = false, folder_browser = false },
          dir_icon_hl = "Default",
          display_stat = { date = true, size = true, mode = true },
          use_fd = true,
          git_status = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = false,
          prompt_prefix = "Dirs> ",
          theme = "dropdown",
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
