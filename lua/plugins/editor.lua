return {
  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<F2>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none",
          ["<cr>"] = "open",
          ["t"] = "open_tabnew",
          ["a"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
          ["d"] = "delete",
          ["r"] = "rename",
          ["h"] = "toggle_hidden",
          ["<c-l>"] = "clear_filter",
          ["/"] = "fuzzy_finder",
          ["?"] = "show_help",
          ["A"] = "add_directory",
        },
      },
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = false,
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "ﰊ",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
        indent = {
          indent_size = 2,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },

  -- Telescope
  {
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
  },
}
