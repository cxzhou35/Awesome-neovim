local status, gl = pcall(require, 'galaxyline')
if (not status) then return end

local vcs = require('galaxyline.providers.vcs')
local fileinfo = require('galaxyline.providers.fileinfo')
local condition = require("galaxyline.condition")

-- Makes galaxyline disappear for nvim-tree
gl.short_line_list = { "NvimTree" }

vim.api.nvim_exec(
  "hi NvimTreeStatusLineNC guibg=#2E3440 guifg=#2E3440",
  false
)

local gls = gl.section

local colors = {
  dark        = '#2E3440',
  dark_grey   = '#3B4252',
  grey        = '#434C5E',
  light_grey  = '#4C566A',

  snow_dark   = '#D8DEE9',
  snow_med    = '#E5E9F0',
  snow_light  = '#ECEFF4',

  yellow   = '#EBCB8B',
  cyan     = '#8FBCBB',
  darkblue = '#5E81AC',
  green    = '#A3BE8C',
  orange   = '#D08770',
  magenta  = '#B48EAD',
  blue     = '#81A1C1',
  red      = '#BF616A',
}

local function insert_left(element)
  table.insert(gls.left, element)
end

local function insert_right(element)
  table.insert(gls.right, element)
end

local in_git_repo = function()
    local branch_name = vcs.get_git_branch()

    return branch_name ~= nil
end

local has_extension = function()
    local file_extension = vim.bo.filetype
    if file_extension ~= '' then
        return true
    else
        return false
    end
end

insert_left{
  Start = {
    provider = function() return '   ' end,
    highlight = {colors.dark,colors.dark}
  }
}

insert_left{
  Space1 = {
    provider = function() return ' ' end,
    condition = in_git_repo,
    highlight = {colors.dark_grey, colors.dark_grey},
  }
}

insert_left{
  ViMode = {
    icon = function()
        local icons = {
            n      = ' ',
            i      = ' ',
            c      = 'ﲵ ',
            V      = '✍ ',
            [''] = '麗',
            v      = '✍ ',
            C      = 'ﲵ ',
            R      = '﯒ ',
            t      = ' ',
        }
        return icons[vim.fn.mode()]
      end,
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n      = 'N',
          i      = 'I',
          c      = 'C',
          V      = 'V',
          [''] = 'B',
          v      = 'v',
          C      = 'C',
          ['r?'] = ':CONFIRM',
          rm     = '--MORE',
          R      = 'R',
          Rv     = 'R&V',
          s      = 'S',
          S      = 'S',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t      = 'T',
          ['!']  = 'SH',
      }
      local mode_color = {
        n = colors.yellow,      i   = colors.green,   v       = colors.blue,
        [''] = colors.blue,   V   = colors.blue,    c       = colors.magenta,
        no = colors.red,        s   = colors.orange,  S       = colors.orange,
        [''] = colors.orange, ic  = colors.yellow,  R       = colors.magenta,
        Rv = colors.magenta,    cv  = colors.red,     ce      = colors.red,
        r = colors.cyan,        rm  = colors.cyan,   ['r?']   = colors.cyan,
        ['!'] = colors.red,     t   = colors.red
      }

      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode]
    end,
    highlight = {colors.dark_grey, colors.dark_grey},
  },
}

insert_left{
  Space2a = {
    provider = function() return ' ' end,
    condition = in_git_repo,
    highlight = {colors.dark_grey, colors.dark_grey},
  }
}

insert_left{
  Space2b = {
    provider = function() return ' ' end,
    condition = function() return not in_git_repo() end,
    highlight = {colors.dark_grey, colors.dark_grey},
  }
}

insert_left{
  Sep1a = {
    provider = function() return ' ' end,
    condition = in_git_repo,
    highlight = {colors.dark_grey,colors.grey},
  }
}

insert_left{
  Sep1b = {
    provider = function() return ' ' end,
    condition = function() return not in_git_repo() end,
    highlight = {colors.dark_grey,colors.light_grey},
  }
}

insert_left {
  GitIcon = {
    provider = function() return ' ' end,
    condition = in_git_repo,
    highlight = {colors.snow_dark,colors.grey},
  },
}

insert_left {
  GitBranch = {
    provider = 'GitBranch',
    condition = in_git_repo,
    highlight = {colors.snow_dark,colors.grey,'bold'},
  },
}

insert_left{
  Space3 = {
    provider = function() return '  ' end,
    condition = in_git_repo,
    highlight = {colors.grey, colors.grey},
  }
}

insert_left {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = in_git_repo,
    icon = ' ',
    highlight = {colors.green,colors.grey},
  },
}

insert_left {
  DiffModified = {
    provider = 'DiffModified',
    condition = in_git_repo,
    icon = ' ',
    highlight = {colors.magenta,colors.grey},
  },
}

insert_left {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = in_git_repo,
    icon = ' ',
    highlight = {colors.red,colors.grey},
  },
}

insert_left{
  Sep2 = {
    provider = function() return ' ' end,
    condition = in_git_repo,
    highlight = {colors.grey, colors.light_grey},
  }
}

insert_left {
  LspClient = {
    provider = 'GetLspClient',
    icon = ' ',
    highlight = {colors.snow_dark,colors.light_grey},
  },
}


insert_left{
  Space4 = {
    provider = function() return '  ' end,
    condition = in_git_repo,
    highlight = {colors.light_grey, colors.light_grey},
  }
}

insert_left{
  Sep3 = {
    provider = function() return ' ' end,
    highlight = {colors.light_grey, colors.dark},
  }
}

insert_right{
  SepR2 = {
    provider = function() return '' end,
    condition = condition.buffer_not_empty,
    highlight = {colors.grey, colors.dark},
  }
}

insert_right{
  SpaceR3 = {
    provider = function() return '  ' end,
    condition = condition.buffer_not_empty,
    highlight = {colors.grey, colors.grey},
  }
}

insert_right{
  LineInfo = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {fileinfo.get_file_icon_color, colors.grey}
  },
}

insert_right{
  SpaceR2 = {
    provider = function() return '  ' end,
    condition = condition.buffer_not_empty,
    highlight = {colors.grey, colors.grey},
  }
}

insert_right{
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.snow_dark,colors.grey},
  },
}

insert_right{
  SepR1a = {
    provider = function() return '' end,
    condition = function() return not condition.buffer_not_empty() end,
    highlight = {colors.dark_grey, colors.dark},
  }
}

insert_right{
  SepR1b = {
    provider = function() return '' end,
    condition = condition.buffer_not_empty,
    highlight = {colors.dark_grey, colors.grey},
  }
}

insert_right{
  SpaceR1 = {
    provider = function() return '  ' end,
    highlight = {colors.dark_grey, colors.dark_grey},
  }
}

insert_right{
  Column = {
    provider = 'LineColumn',
    icon = ' : ',
    highlight = {colors.snow_dark,colors.dark_grey},
  },
}

insert_right{
  SpaceR = {
    provider = function() return '  ' end,
    highlight = {colors.dark_grey, colors.dark_grey},
  }
}

insert_right{
  End = {
    provider = function() return '  ' end,
    highlight = {colors.dark_grey,}
  }
}
