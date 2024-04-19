return {
  "neovim/nvim-lspconfig",
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
        ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              },
              codeLens = {
                enable = true,
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
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
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
      },
      pyright = {
        settings = {
          python = {
            analysis = {
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
    },
  },
}
