return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gr", false }
    end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("lazyvim.util").has("nvim-cmp")
        end,
      },
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        -- lua lsp
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              completion = {
                callSnippet = "Replace",
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        -- pyright
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
              },
            },
          },
        },
        -- texlab
        texlab = {
          settings = {
            tex = {
              build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "xelatex",
                forwardSearchAfter = false,
                onSave = false,
              },
              chktex = {
                onEdit = false,
                onOpenAndSave = false,
              },
              -- diagnosticsDelay = 100,
              formatterLineLength = 100,
              forwardSearch = {
                args = {},
              },
              latexFormatter = "latexindent",
              bibtexFormatter = "texlab",
              latexindent = {
                modifyLineBreaks = false,
              },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
      require("lazyvim.util").on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      -- Add folding capabilities required by ufo.nvim
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available thourgh mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {
        "clangd",
        "vimls",
        "texlab",
        "gopls",
        "tsserver",
        "lua_ls",
        "pyright",
        "marksman",
      } ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed })
        mlsp.setup_handlers({ setup })
      end
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      ui = {
        -- Currently, only the round theme exists
        theme = "round",
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = "󰏷 ",
        outgoing = "󰏻 ",
        hover = " ",
        colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
        -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
      -- winbar config
      symbol_in_winbar = {
        enable = true,
        show_file = true,
        separator = "  ",
        hide_keyword = false,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      -- lightbulb config
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
      },
      -- diagnostic config
      diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        -- 1 is max
        max_width = 0.7,
        custom_fix = nil,
        custom_msg = nil,
        text_hl_follow = false,
        keys = { exec_action = "o", quit = "q", go_action = "g" },
      },
      -- finder icons
      finder_icons = { def = "  ", ref = "󰵚 ", link = "󰴜 " },
      -- finder config
      finder = {
        jump_to = "p",
        edit = { "o", "<CR>" },
        tabe = "t",
        quit = { "q", "<ESC>" },
      },
      -- show outline
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        auto_enter = true,
        auto_preview = false,
        virt_text = "┃",
        keys = { jump = "o", expand_collapse = "u", quit = "q" },
        -- auto refresh when change buffer
        auto_refresh = true,
      },
      -- difinition config
      definition = {
        edit = "<S-c>o",
        vsplit = "<S-c>v",
        split = "<S-c>i",
        tabe = "<S-c>t",
        quit = "q",
        close = "<Esc>",
      },
      -- code action config
      code_action = {
        num_shortcut = true,
        keys = {
          -- string | table type
          quit = "q",
          exec = "<CR>",
        },
      },
      request_timeout = 3000,
    },
  },
}
