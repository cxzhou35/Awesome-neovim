return {
  "zbirenbaum/copilot.lua",
  opts = {
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
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    keys = { { "<leader>cu", "<cmd>CopilotChatToggle<cr>", desc = "Toggle chat window" } },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
    },
  },
}
