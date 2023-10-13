local Util = require("lazyvim.util")

---@type ConformOpts
local format_opts = {}

return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      -- Install the conform formatter on VeryLazy
      require("lazyvim.util").on_very_lazy(function()
        require("lazyvim.util").format.register({
          name = "conform.nvim",
          priority = 100,
          primary = true,
          format = function(buf)
            require("conform").format(Util.merge(format_opts, { bufnr = buf }))
          end,
          sources = function(buf)
            local ret = require("conform").list_formatters(buf)
            return vim.tbl_map(function(v)
              return v.name
            end, ret)
          end,
        })
      end)
    end,
    ---@class ConformOpts
    opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 1000,
        lsp_fallback = true,
        async = false,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        python = { "isort", "black" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        markdown = { "markdownlint" },
        tex = { "latexindent" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
      -- LazyVim will merge the options you set here with builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string,table>
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- -- Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
    },
    ---@param opts ConformOpts
    config = function(_, opts)
      opts.formatters = opts.formatters or {}
      for name, formatter in pairs(opts.formatters) do
        if type(formatter) == "table" then
          local ok, defaults = pcall(require, "conform.formatters." .. name)
          if ok and type(defaults) == "table" then
            opts.formatters[name] = vim.tbl_deep_extend("force", {}, defaults, formatter)
          end
        end
      end
      for _, key in ipairs({ "format_on_save", "format_after_save" }) do
        if opts[key] then
          Util.warn(
            ("Don't set `opts.%s` for `conform.nvim`.\n**LazyVim** will use the conform formatter automatically"):format(
              key
            )
          )
          opts[key] = nil
        end
      end
      format_opts = opts.format
      require("conform").setup(opts)
    end,
  },
}
