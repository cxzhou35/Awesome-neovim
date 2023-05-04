return {
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>rc", "<cmd>RunCode<cr>", desc = "Run Code" },
      { "<leader>rf", "<cmd>RunFile<cr>", desc = "Run File" },
      { "<leader>rp", "<cmd>RunProject<cr>", desc = "Run Project" },
      { "<leader>rd", "<cmd>RunClose<cr>", desc = "Run Close" },
    },
    config = {
      -- choose default mode (valid term, tab, float, toggle, buf)
      mode = "term",
      -- Focus on runner window(only works on toggle, term and tab mode)
      focus = true,
      -- startinsert (see ':h inserting-ex')
      startinsert = false,
      term = {
        --  Position to open the terminal, this option is ignored if mode is tab
        position = "bot",
        -- window size, this option is ignored if tab is true
        size = 8,
      },
      float = {
        -- Key that close the code_runner floating window
        close_key = "q",
        -- Window border (see ':h nvim_open_win')
        border = "none",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0,
      },
      filetype = {
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        python = "python3 -u",
        sh = "bash",
        rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
        go = "go run",
      },
      project_path = "", -- No default path defined
      project = {},
    },
    ft = { "lua", "python", "c", "cpp", "go", "sh" },
  },
}
