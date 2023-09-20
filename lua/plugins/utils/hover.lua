return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup({
      init = function()
        -- Require providers
        require("hover.providers.gh")
        -- require('hover.providers.gh_user')
        require("hover.providers.lsp").setup()
        require("hover.providers.man")
        require("hover.providers.dictionary")
      end,
      preview_opts = {
        border = "rounded",
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
    })
    -- vim.keymap.set("n", "gh", require("hover").hover, { desc = "Hover" })
    vim.keymap.set("n", "<leader>gk", require("hover").hover_select, { desc = "Select Hover" })
  end,
}
