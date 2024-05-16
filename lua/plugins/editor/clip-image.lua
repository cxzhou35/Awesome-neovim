return {
  {
    "dfendr/clipboard-image.nvim",
    event = "VeryLazy",
    opts = {
      -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
      -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
      -- Missing options from `markdown` field will be replaced by options from `default` field
      markdown = {
        img_dir = { "assets", "img" },
        img_dir_txt = "./assets/img",
        img_handler = function(img)
          vim.cmd("normal! f[") -- go to [
          vim.cmd("normal! a" .. img.name) -- append text with image name
        end,
      },
      tex = {
        affix = "\\begin{figure}[htbp]\n\\centering\n\\includegraphics[width=0.5\\textwidth]{%s}\n\\caption{}\n\\label{fig:}\n\\end{figure}",
      },
    },
    ft = { "tex", "markdown" },
    keys = {
      { "<leader>i", "<cmd>PasteImg<cr>", desc = "Paste image" },
    },
  },
}
