return {
  "nvimdev/guard.nvim",
  -- event = "BufReadPre",
  event = "VeryLazy",
  config = function()
    local ft = require("guard.filetype")
    ft("lua"):fmt("stylua"):lint("luacheck")
    ft("c, cpp"):fmt("clang-format")
    ft("sh"):fmt("shfmt")
    ft("markdown"):fmt("markdownlint")
    ft("tex"):fmt("latexindent")
    ft("python"):fmt("black")
    ft("typescript, javascript, javascriptreact, typescriptreact"):fmt("prettier")

    require("guard").setup({
      -- the only options for the setup function
      fmt_on_save = true,
      -- Use lsp if no formatter was defined for this filetype
      lsp_as_default_formatter = true,
    })
  end,
}
