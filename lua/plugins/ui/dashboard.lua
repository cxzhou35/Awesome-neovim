return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  event = "VimEnter",
  opts = function()
    local logo = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
    ]]

    logo = string.rep("\n", 5) .. logo .. "\n"

    local function getGreeting(name)
      local tableTime = os.date("*t")
      local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
      local hour = tableTime.hour
      local greetingsTable = {
        [1] = "  Sleep well",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "󰖔  Good night",
      }
      local greetingIndex = 0
      if hour == 23 or hour < 7 then
        greetingIndex = 1
      elseif hour < 12 then
        greetingIndex = 2
      elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
      elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
      elseif hour >= 21 then
        greetingIndex = 5
      end
      return datetime .. "\t\t" .. greetingsTable[greetingIndex] .. ", " .. name .. string.rep("\n", 2)
    end

    local userName = "Chenxu"
    local greeting = getGreeting(userName)

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
      config = {
        header = vim.split(logo .. "\n" .. greeting, "\n"),
        -- stylua: ignore
        center = {
          { action = LazyVim.telescope("files"),                       desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                             desc = " Recent Files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                            desc = " Find Text",       icon = " ", key = "g" },
          { action = [[lua LazyVim.telescope.config_files()()]],       desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = "󰄉 ", key = "s" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                             desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local version = "  󰥱 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
          local plugins = "⚡Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          local footer = version .. "\t" .. plugins
          return { footer }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
