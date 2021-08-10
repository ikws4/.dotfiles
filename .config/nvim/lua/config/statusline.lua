local gl = require "galaxyline"
local condition = require "galaxyline.condition"

local gls = gl.section

local colors = {
  black = "#232633",
  white = "#FFFFFF",

  red = "#ED6073",
  green = "#CBE697",
  blue = "#9CDCFB",
  yellow = "#F8CC7A",
  purple = "#CBA9EA",

  grey = "#A9AECC",
  darkgrey = "#686E92",
}

local mode_color = function()
  local mode_colors = {
    n = colors.green,
    i = colors.blue,
    v = colors.yellow,
    c = colors.green,
    V = colors.yellow,
    [""] = colors.yellow,
    R = colors.red,
  }
  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.green
  end

  return color
end

local function get_nvim_lsp_diagnostic(diag_type)
  local count = 0
  local active_clients = vim.lsp.get_active_clients()

  if active_clients then
    for _, client in ipairs(active_clients) do
      count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(), diag_type, client.id)
    end
  end

  return count
end

gl.short_line_list = { "NvimTree", "packer" }

gls.left[1] = {
  FirstElement = {
    provider = function()
      return "┃"
    end,
    separator = " ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.purple, colors.black, "bold" },
  },
}

-- gls.left[2] = {
--   BufferNumber = {
--     provider = function()
--       return require("galaxyline.provider_buffer").get_buffer_number()
--     end,
--     separator = "  ",
--     separator_highlight = { colors.black, colors.black },
--     highlight = { colors.blue, colors.black, "bold" },
--   },
-- }

gls.left[3] = {
  VimMode = {
    provider = function()
      vim.cmd("hi GalaxyVimMode guifg=" .. mode_color())
      return ""
    end,
    separator = "  ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.green, colors.black, "bold" },
  },
}

gls.left[4] = {
  FileSize = {
    provider = function()
      local size = require("galaxyline.provider_fileinfo").get_file_size()
      return vim.trim(size)
    end,
    separator = "  ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.grey, colors.black },
  },
}

gls.left[5] = {
  FileTypeIcon = {
    provider = function()
      local fileinfo = require "galaxyline.provider_fileinfo"
      vim.cmd("hi GalaxyFileTypeIcon guifg=" .. fileinfo.get_file_icon_color())
      return fileinfo.get_file_icon()
    end,
    highlight = { colors.black, colors.black, "bold" },
  },
}

gls.left[6] = {
  FileStateIcon = {
    provider = function()
      if vim.bo.readonly then
        vim.cmd("hi GalaxyFileStateIcon guifg=" .. colors.yellow)
        return " "
      elseif vim.bo.modifiable and vim.bo.modified then
        vim.cmd("hi GalaxyFileStateIcon guifg=" .. colors.red)
        return " "
      else
        return ""
      end
    end,
    highlight = { colors.blackk, colors.black, "bold" },
  },
}

gls.left[7] = {
  SimpleCurrentDirectory = {
    provider = function()
      if vim.bo.modifiable and vim.bo.modified then
        vim.cmd("hi GalaxySimpleCurrentDirectory guifg=" .. colors.red)
      else
        vim.cmd("hi GalaxySimpleCurrentDirectory guifg=" .. colors.green)
      end

      local currentDir = vim.fn.expand "%:h"
      local separator = string.byte "/"
      for i = #currentDir, 1, -1 do
        if currentDir:byte(i) == separator then
          return currentDir:sub(i + 1, #currentDir) .. "/"
        end
      end
      return ""
    end,
    highlight = { colors.green, colors.black, "bold" },
  },
}

gls.left[8] = {
  FileName = {
    provider = function()
      if vim.bo.modifiable and vim.bo.modified then
        vim.cmd("hi GalaxyFileName guifg=" .. colors.red)
      else
        vim.cmd("hi GalaxyFileName guifg=" .. colors.grey)
      end

      return vim.fn.expand "%:t"
    end,
    separator = "  ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.grey, colors.black, "bold" },
  },
}

-- gls.left[9] = {
--   FileLocation = {
--     provider = function()
--       local line = vim.fn.line "."
--       local column = vim.fn.col "."
--       return line .. ":" .. column
--     end,
--     separator = " ",
--     separator_highlight = { colors.black, colors.black },
--     highlight = { colors.grey, colors.black },
--   },
-- }

gls.left[10] = {
  FileProgress = {
    provider = function()
      return vim.trim(require("galaxyline.provider_fileinfo").current_line_percent())
    end,
    separator = "  ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.grey, colors.black },
  },
}

gls.left[11] = {
  LspStatus = {
    provider = function()
      return require("lsp-status").status_progress()
    end,
    highlight = { colors.grey, colors.black },
  },
}

gls.right[1] = {
  FileFormat = {
    provider = function()
      return vim.bo.filetype
    end,
    highlight = { colors.blue, colors.black, "bold" },
  },
}

gls.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    separator = "   ",
    condition = condition.check_git_workspace,
    separator_highlight = { colors.green, colors.black },
    highlight = { colors.green, colors.black, "bold" },
  },
}

gls.right[3] = {
  DiagnosticIcon = {
    provider = function()
      local error = get_nvim_lsp_diagnostic "Error"
      local warning = get_nvim_lsp_diagnostic "Warning"

      if error > warning then
        vim.cmd("hi GalaxyDiagnosticIcon guifg=" .. colors.red)
        return ""
      elseif warning > 0 then
        vim.cmd("hi GalaxyDiagnosticIcon guifg=" .. colors.yellow)
        return "!"
      else
        vim.cmd("hi GalaxyDiagnosticIcon guifg=" .. colors.green)
        return ""
      end
    end,
    separator = "  ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.yellow, colors.black, "bold" },
  },
}

gls.right[4] = {
  DiagnosticError = {
    provider = function()
      return get_nvim_lsp_diagnostic "Error"
    end,
    separator = " ",
    separator_highlight = { colors.black, colors.black },
    highlight = { colors.red, colors.black, "bold" },
  },
}

gls.right[5] = {
  DiagnosticWarn = {
    provider = function()
      return get_nvim_lsp_diagnostic "Warning"
    end,
    separator = "/",
    separator_highlight = { colors.grey, colors.black },
    highlight = { colors.yellow, colors.black, "bold" },
  },
}

gls.right[6] = {
  DiagnosticInfo = {
    provider = function()
      return get_nvim_lsp_diagnostic "Information" + get_nvim_lsp_diagnostic "Hint"
    end,
    separator = "/",
    separator_highlight = { colors.grey, colors.black },
    highlight = { colors.green, colors.black, "bold" },
  },
}
