local status, cn = pcall(require, "carbon-now")
if not status then return end

cn.setup({
    base_url = "https://carbon.now.sh/",
    open_cmd = "google-chrome",
    options = {
        theme = "solarized",
        window_theme = "none",
        font_family = "Hack",
        font_size = "18px",
        bg = "gray",
        line_numbers = true,
        line_height = "133%",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        drop_shadow_blur = "68px",
        width = "680",
        watermark = false
    }
})
