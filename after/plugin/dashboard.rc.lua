local status, db = pcall(require, 'dashboard')
if (not status) then return end
db.custom_header = {
    '                                                              ',
    '    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ',
    ' ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ',
    ' ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ',
    '   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ',
    '      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ',
    '        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ',
    '             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ',
    '             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ',
    '             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ',
    '                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ',
    '                            ⠘⣷⠁                               ',
    '                             ⠙⣤                               ',
    '                              ⠛⠂                              ',
    '                                                              '
}

db.custom_center = {
      {icon = '      ',
      desc = '    New File                               ',
      action ='DashboardNewFile',
      },

      {icon = '      ',
      desc = '    Recently opened files                   ',
      action =  'Telescope oldfiles',
      },

      {icon = '      ',
      desc = '    Find File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      },

      {icon = '      ',
      desc = '    File Browser                            ',
      action =  'Telescope file_browser',
      },

      {icon = '      ',
      desc = '    Find Word                              ',
      action = 'Telescope live_grep',
      }
    }


local plugins_count = vim.fn.len(
    vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
)
db.custom_footer = {'-- Neovim Loaded ' .. plugins_count .. ' Plugins --'}

local dashboard_height = 27
db.header_pad  = math.floor((vim.api.nvim_list_uis()[1]['height'] - dashboard_height) / 4)

vim.cmd([[highlight DashboardHeader guifg=#ffffff]])

