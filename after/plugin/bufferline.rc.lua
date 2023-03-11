local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = "thin",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_buffer_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    color_icons = true,
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    tab_size = 15,
    max_name_length = 25,
    numbers = function(opts)
      return string.format("%s.", opts.ordinal)
    end,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
  },
  highlights = {
    separator = { fg = "#E6E6FA", bg = "#80989b" },
    separator_selected = { fg = "#483D8B", bg = "#304758" },
    buffer_selected = { fg = "#fdf6e3", bold = true },
  },
})
