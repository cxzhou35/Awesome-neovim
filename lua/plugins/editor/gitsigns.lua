return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    watch_gitdir = { interval = 1000, follow_files = true },
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 200,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    yadm = { enable = false },
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", gs.toggle_current_line_blame, "Toggle line blame")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
  },
}
