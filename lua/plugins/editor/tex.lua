return {
  {
    "frabjous/knap",
    keys = {
      {
        "<leader>pk",
        function()
          require("knap").toggle_autopreviewing()
        end,
        desc = "Knap toggle auto previewing",
      },
      {
        "<leader>ps",
        function()
          require("knap").forward_jump()
        end,
        desc = "Knap forward jump",
      },
    },
    ft = { "tex", "markdown" },
  },
  {
    "ryleelyman/latex.nvim",
    ft = "tex",
  },

  -- inverse serach for LaTeX
  {
    "f3fora/nvim-texlabconfig",
    config = true,
    build = "go build",
    ft = "tex",
  },
}
