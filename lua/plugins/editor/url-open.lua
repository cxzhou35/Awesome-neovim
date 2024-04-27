return {
  "sontungexpt/url-open",
  branch = "mini",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  keys = {
    { "gx", "<esc>:URLOpenUnderCursor<cr>", desc = "Open URL under cursor" },
  },
  config = function()
    local status_ok, url_open = pcall(require, "url-open")
    if not status_ok then
      return
    end
    url_open.setup({})
  end,
}
