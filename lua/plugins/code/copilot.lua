return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
          python = true,
          lua = true,
          c = true,
          cpp = true,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    keys = { { "<leader>cu", "<cmd>CopilotChatToggle<cr>", desc = "Toggle chat window" } },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      config = function()
        require("CopilotChat.integrations.cmp").setup()
        require("CopilotChat").setup({
          debug = false,
          show_folds = true,
          highlight_selection = true,
          mappings = {
            complete = {
              insert = "",
            },
          },
        })
      end,
    },
  },
}
