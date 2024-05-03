return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable keymaps for LSP
    keys[#keys + 1] = { "K", false }
  end,
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
    },
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    inlay_hints = {
      enabled = false,
    },
    -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
    codelens = {
      enabled = false,
    },
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    -- LSP Server Settings
    servers = {
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- keys = {},
        single_file_support = true,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
              disable = { "incomplete-signature-doc", "trailing-space" },
              groupSeverity = {
                strong = "Warning",
                strict = "Warning",
              },
              unusedLocalExclude = { "_*" },
              -- library = vim.api.nvim_get_runtime_file("", true),
            },
            completion = {
              workspaceWord = true,
              callSnippet = "Replace",
            },
            codeLens = {
              enable = false,
            },
            hint = {
              enable = false,
              setType = false,
              paramType = true,
              arrayIndex = "Disable",
            },
            doc = {
              privateName = { "^_" },
            },
            type = {
              castNumberToInteger = true,
            },
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              logLevel = "Warning",
              typeCheckingMode = "basic", -- off, basic, strict
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
              diagnosticMode = "workspace",
              diagnosticSeverityOverrides = {
                strictListInference = true,
                strictDictionaryInference = true,
                strictSetInference = true,
                reportUnusedImport = "warning",
                reportUnusedClass = "warning",
                reportUnusedFunction = "warning",
                reportUnusedVariable = "warning",
                reportUnusedCoroutine = "warning",
                reportDuplicateImport = "warning",
                reportPrivateUsage = "warning",
                reportUnusedExpression = "warning",
                reportConstantRedefinition = "error",
                reportIncompatibleMethodOverride = "error",
                reportMissingImports = "error",
                reportUndefinedVariable = "error",
                reportAssertAlwaysTrue = "error",
              },
            },
          },
        },
      },
      jsonls = {
        settings = {
          json = {
            format = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
