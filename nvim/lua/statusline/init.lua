local gl = require "galaxyline"
local path = require "plenary.path"
local gls = gl.section
gl.short_line_list = { "NvimTree", "packer" }

local colors = {
  bg = "#282c34",
  cyan = "#008080",
  darkblue = "#081633",
  magenta = "#d16d9e",
  blue = "#0087d7",
  white = "#FFFFFF",
  black = "#272822",
  lightblack = "#2D2E27",
  lightblack2 = "#383a3e",
  arkblack = "#211F1C",
  grey = "#8F908A",
  lightgrey = "#575b61",
  darkgrey = "#64645e",
  warmgrey = "#75715E",
  pink = "#F93C80",
  green = "#84F57D",
  aqua = "#66d9ef",
  darkaqua = "#4EADE5",
  yellow = "#FFFF43",
  orange = "#FFBD37",
  deepOrange = "#FF8C00",
  purple = "#ae81ff",
  darkpurple = "#855dcf",
  red = "#FF1919",
  darkred = "#F44747",
  addfg = "#d7ffaf",
  addbg = "#5f875f",
  delbg = "#f75f5f",
  changefg = "#d7d7ff",
  changebg = "#5f5f87",
}
-- local colors = {
-- }

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand "%:t") ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function()
      return "▋"
    end,
    highlight = { colors.blue, colors.darkaqua },
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "NORMAL",
        no = "N·Operator Pending",
        v = "Visual",
        V = "V·Line",
        ["^V"] = "V·Block",
        s = "Select",
        S = "S·Line",
        ["^S"] = "S·Block",
        i = "Insert",
        R = "Replace",
        Rv = "V·Replace",
        c = "Command",
        cv = "Vim Ex",
        ce = "Ex",
        r = "Prompt",
        rm = "More",
        ["r?"] = "Confirm",
        ["!"] = "Shell",
        t = "Terminal",
      }

      return "  " .. string.upper(alias[vim.fn.mode()] or "V-Block") .. " "
    end,
    separator = "\u{e0b0}" .. " ",
    separator_highlight = {
      colors.purple,
      function()
        if not buffer_not_empty() then
          return colors.purple
        end
        return colors.darkblue
      end,
    },
    highlight = { colors.darkblue, colors.purple, "bold" },
  },
}
gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.darkblue },
  },
}

local function filename()
  local win_id = vim.fn.win_getid()
  local buf_nr = vim.fn.winbufnr(win_id)
  local buf_name = vim.fn.bufname(buf_nr)
  local base_name = vim.fn.fnamemodify(buf_name, [[:~:.]])
  local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(win_id)))
  if string.len(base_name) <= space then
    return base_name .. " "
  else
    return vim.fn.pathshorten(base_name) .. " "
  end
end

gls.left[4] = {
  FileName = {
    provider = filename,
    condition = buffer_not_empty,
    -- separator = "\u{e0b0}",
    -- separator_highlight = { colors.darkblue },
    highlight = { colors.magenta, colors.darkblue },
  },
}
gls.left[5] = {
  GitBranch = {
    provider = "GitBranch",
    icon = "  " .. "  ",
    -- separator = "\u{e0b0}",
    -- separator_highlight = { colors.purple },
    condition = function()
      return buffer_not_empty and require("galaxyline.condition").check_git_workspace()
    end,
    highlight = { colors.black, colors.purple },
  },
}

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[6] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = { colors.green, colors.purple },
  },
}
gls.left[7] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = { colors.orange, colors.purple },
  },
}
gls.left[8] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = { colors.red, colors.purple },
  },
}
gls.left[9] = {
  LeftEnd = {
    provider = function()
      return " " .. require("lsp-status").status() .. " "
    end,
    separator = "\u{e0b0}",
    separator_highlight = { colors.purple, "NONE" },
    highlight = { colors.black, colors.purple },
  },
}
gls.right[1] = {
  FileFormat = {
    provider = "FileFormat",
    separator = "\u{e0b2}",
    separator_highlight = { colors.purple, "NONE" },
    highlight = { colors.black, colors.purple },
  },
}
gls.right[2] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " " .. "\u{e0b2}" .. " ",
    separator_highlight = { colors.purple, colors.purple },
    highlight = { colors.black, colors.purple },
  },
}
gls.right[3] = {
  ScrollBar = {
    provider = "ScrollBar",
    highlight = { colors.black, colors.purple },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = "\u{e0b0}",
    separator_highlight = { colors.purple, "NONE" },
    highlight = { colors.black, colors.purple, "bold" },
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    separator = "\u{e0b2}",
    separator_highlight = { colors.purple },
    highlight = { colors.black, colors.purple },
  },
}
