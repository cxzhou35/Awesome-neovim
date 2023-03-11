local status, headlines = pcall(require, "headlines")
if not status then
  return
end

headlines.setup({
  markdown = {
    -- Only use for Nord Theme
    -- headline_highlights = {
    --     "Headline1", "Headline2", "Headline3", "Headline4", "Headline5",
    --     "Headline6"
    -- },
    headline_highlights = { "Height" },
    codeblock_highlight = "CodeBlock",
    dash_highlight = "Dash",
    quote_highlight = "Quote",
    quote_string = "┃",
    fat_headlines = false,
    fat_headline_upper_string = "▃ ",
    fat_headline_lower_string = "🬂 ",
  },
})
