return {
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
      ---@diagnostic disable-next-line: param-type-mismatch
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
      -- hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
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
