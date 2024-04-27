return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<F2>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
  opts = {
    source_selector = {
      winbar = false,
      statusline = false,
    },
    buffers = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
    },
    filesystem = {
      hide_gitignored = true,
      hide_by_name = {
        "node_modules",
        "__pycache__",
      },
      never_show = {
        ".DS_Store",
        "thumbs.db",
      },
    },
    window = {
      position = "left",
      width = 30,
      mappings = {
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
        ["s"] = "noop",
        ["d"] = "delete",
        ["r"] = "rename",
        ["h"] = "toggle_hidden",
        ["<C-l>"] = "clear_filter",
        ["/"] = "fuzzy_finder",
        ["?"] = "show_help",
        ["o"] = "open_vsplit",
        ["n"] = "add_directory",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
      },
    },
    popup_border_style = "rounded",
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    enable_modified_markers = true,
    sort_case_insensitive = false,
    default_component_configs = {
      modified = {
        symbol = " ",
        highlight = "NeoTreeModified",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖ ", -- this can only be used in the git_status source
          renamed = "󰁕 ", -- this can only be used in the git_status source
          -- Status type
          untracked = " ",
          ignored = " ",
          unstaged = "󰄗 ",
          staged = " ",
          conflict = " ",
        },
      },
      indent = {
        padding = 1, -- extra padding on left hand side
        indent_size = 2,
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            --auto close
            require("neo-tree").close_all()
          end,
        },
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
      },
    },
  },
}
