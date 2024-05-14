if lazyvim_docs then
  vim.g.lazyvim_python_lsp = "pyright"
end

local lsp = vim.g.lazyvim_python_lsp or "pyright"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "pyright", "black" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              enabled = lsp == "pyright",
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
        basedpyright = {
          enabled = lsp == "basedpyright",
        },
        [lsp] = {
          enabled = true,
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },
  {
    "kmontocam/nvim-conda",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "python" },
    keys = {
      { "<leader>pc", "<cmd>CondaActivate<cr>", desc = "Activate Conda Env" },
      { "<leader>pd", "<cmd>CondaDeactivate<cr>", desc = "Deactivate Conda Env" },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    ft = { "python" },
    opts = {
      search = false,
      name = {
        "venv",
        ".venv",
        "env",
        "envs",
        ".env",
      },
      anaconda_base_path = "/Users/vercent/miniconda3",
      anaconda_envs_path = "/Users/vercent/miniconda3/envs",
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
