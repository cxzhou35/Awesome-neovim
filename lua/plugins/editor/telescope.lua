return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { ";b", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { ";c", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },
    { ";h", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { ";k", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { ";f", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { ";F", LazyVim.pick("files", { cwd = false }), desc = "Find Files (cwd)" },
    { ";o", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { ";s", "<cmd>Telescope symbols<cr>", desc = "Symbols" },
    { ";w", "<cmd>Telescope grep_string<cr>", desc = "Grep Words" },
    { ";O", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
    {
      ";r",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep()
      end,
      desc = "Search for a string in your current working directory",
    },
    { ";R", LazyVim.pick("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    {
      ";t",
      function()
        local builtin = require("telescope.builtin")
        builtin.help_tags()
      end,
      desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
    },
    { ";e", "<cmd>Telescope diagnostics bufnr=2<cr>", desc = "Document Diagnostics" },
    { ";x", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
    { ";l", "<cmd>Telescope loclist<cr>", desc = "Location List" },
    {
      ";;",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "Resume the previous telescope picker",
    },
    -- { ";y", "<cmd>Telescope yank_history<cr>", desc = "Yank History" },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          previewer = false,
        }))
      end,
      desc = "[/] Fuzzily search in current buffer]",
    },
    -- extensions
    { ";u", "<cmd>Telescope undo<cr>", desc = "Undo History" },
    { ";a", "<cmd>Telescope live_grep_args<cr>", desc = "Grep With Args" },
    -- {
    --   ";w",
    --   "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>",
    --   desc = "Word Grep With Args ",
    -- },
    {
      ";v",
      "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<cr>",
      desc = "Visual Grep With Args",
      mode = { "n", "v", "x" },
    },
    {
      "<C-f>",
      function()
        local telescope = require("telescope")

        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end,
      desc = "Open File Browser with the path of the current buffer",
    },
  },
  dependencies = {
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    {
      "gbprod/yanky.nvim",
      enabled = false,
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
    { "nvim-telescope/telescope-symbols.nvim" },
  },
  config = function()
    local tla = require("telescope.actions")
    local tua = require("telescope-undo.actions")
    local tlgaa = require("telescope-live-grep-args.actions")
    local tfba = require("telescope").extensions.file_browser.actions
    require("telescope").setup({
      defaults = {
        prompt_prefix = string.format("%s ", ""),
        selection_caret = string.format("%s ", ""),
        path_display = { "truncate" },
        initial_mode = "insert",
        sorting_strategy = "ascending",
        color_devicons = true,
        dynamic_preview_title = true,
        mappings = {
          i = {
            ["esc"] = tla.close,
          },
          n = {
            ["q"] = tla.close,
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
        file_ignore_patterns = {
          "lazy-lock.json",
          "node_modules",
          "yarn.lock",
          ".DS_Store",
        },
      },
      pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        undo = {
          use_delta = true,
          side_by_side = true,
          layout_strategy = "flex",
          use_custom_command = { "bash", "-c", "echo '$DIFF' | delta --file-style omit" },
          diff_context_lines = 13,
          mappings = {
            i = {
              ["<cr>"] = tua.restore,
            },
            n = {
              ["u"] = tua.restore,
            },
          },
        },
        live_grep_args = {
          auto_quoting = false, -- enable/disable auto-quoting
          mappings = {
            i = {
              ["<C-k>"] = tlgaa.quote_prompt(),
              ["<C-i>"] = tlgaa.quote_prompt({ postfix = " --iglob " }),
            },
          },
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
          hijack_netrw = true,
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
              ["n"] = tfba.create,
              ["h"] = tfba.goto_parent_dir,
              ["."] = tfba.toggle_hidden,
              ["o"] = tfba.open,
              ["r"] = tfba.rename,
              ["y"] = tfba.copy,
              ["s"] = tfba.sort_by_size,
              ["d"] = tfba.remove,
              ["m"] = tfba.move,
              ["<PageUp>"] = tla.preview_scrolling_up,
              ["<PageDown>"] = tla.preview_scrolling_down,
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
    require("telescope").load_extension("live_grep_args")
    -- require("telescope").load_extension("yank_history")
  end,
}
