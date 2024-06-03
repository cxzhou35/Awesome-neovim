return {
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        ["lua"] = { "luacheck" },
        ["python"] = { "mypy" },
        -- ['_'] = { 'fallback linter' },
        -- ["*"] = { "typos" },
      },
    },
  },
}
