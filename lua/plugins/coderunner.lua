return {
  -- Code runner
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = true,
    opts = {
      filetype = {
        python = "python3 -u",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        sh = "bash",
        go = "go run",
        lua = "lua",
        julia = "julia",
      },
    },
    keys = {
      vim.keymap.set("n", "<leader>rc", ":RunCode<CR>", { noremap = true, silent = true, desc = "Run code" }),
      vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = true, desc = "Run file" }),
      vim.keymap.set("n", "<leader>rd", ":RunClose<CR>", { noremap = true, silent = true, desc = "Close run" }),
      vim.keymap.set(
        "n",
        "<leader>rt",
        ":RunFile term<CR>",
        { noremap = true, silent = true, desc = "Run file in terminal" }
      ),
    },
  },
}
