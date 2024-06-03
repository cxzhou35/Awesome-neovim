return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    allow_different_key = true,
    hints = {
      ["[dcyvV][ia][%(%)]"] = {
        message = function(keys)
          return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
        end,
        length = 3,
      },
    },
    max_count = 5,
    hint = true,
    notification = true,
    disabled_filetypes = {
      "qf",
      "netrw",
      "NvimTree",
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "noice",
      "prompt",
      "TelescopePrompt",
      "toggleterm",
      "neogitstatus",
      "lazyterm",
      "txt",
      "cmp_docs",
      "cmp_menu",
    },
  },
}
