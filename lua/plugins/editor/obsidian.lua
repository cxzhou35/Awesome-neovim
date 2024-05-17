return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open Obsidian note", mode = "n" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert Obsidian template", mode = "n" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Create Obsidian notes today", mode = "n" },
    { "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle Obsidian checkbox", mode = "n" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/Notes",
      },
      {
        name = "Dev",
        path = "~/DevNotes",
        overrides = {
          notes_subdir = "notes",
        },
      },
    },
    notes_subdir = "notes",
    new_notes_location = "notes_subdir",
    open_app_foreground = false,
    disable_frontmatter = false,
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      min_chars = 2,
    },
    ui = {
      enable = true,
      update_debounce = 200,
    },

    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
      template = "templates/daily-note-template.md",
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
      tags = "",
    },

    wiki_link_func = function(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,

    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags, status = false }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    note_id_func = function(title)
      return title
    end,

    attachments = {
      img_folder = "assets/images",
      ---@param client obsidian.Client
      ---@param path obsidian.Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },

    mappings = {
      -- mapping to work on markdown/wiki links within your vault.
      ["gw"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
  },
}
