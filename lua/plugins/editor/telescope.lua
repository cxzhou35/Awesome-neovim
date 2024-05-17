return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { ";b", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { ";c", LazyVim.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },
    { ";h", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { ";k", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { ";f", LazyVim.telescope("files"), desc = "Find Files (Root Dir)" },
    { ";F", LazyVim.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { ";o", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { ";s", "<cmd>Telescope symbols<cr>", desc = "Symbols" },
    { ";O", LazyVim.telescope("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
    {
      ";r",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep({
          additional_args = { "--hidden" },
        })
      end,
      desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
    },
    {
      ";n",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end,
      desc = "Search for Neovim config files",
    },
    { ";R", LazyVim.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    {
      ";t",
      function()
        local builtin = require("telescope.builtin")
        builtin.help_tags()
      end,
      desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
    },
    { ";e", "<cmd>Telescope diagnostics bufnr=2<cr>", desc = "Document Diagnostics" },
    -- extensions
    { ";u", "<cmd>Telescope undo<cr>", desc = "Undo History" },
    { ";a", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Grep With Args" },
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
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
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
      pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
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
              ["n"] = require("telescope").extensions.file_browser.actions.create,
              ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
              ["."] = require("telescope").extensions.file_browser.actions.toggle_hidden,
              ["o"] = require("telescope").extensions.file_browser.actions.open,
              ["r"] = require("telescope").extensions.file_browser.actions.rename,
              ["y"] = require("telescope").extensions.file_browser.actions.copy,
              ["s"] = require("telescope").extensions.file_browser.actions.sort_by_size,
              ["d"] = require("telescope").extensions.file_browser.actions.remove,
              ["m"] = require("telescope").extensions.file_browser.actions.move,
              ["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
              ["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
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
