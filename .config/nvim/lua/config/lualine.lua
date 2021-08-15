local colors = {
  black = "#232633",
  darkblack = "#282C3C",
  white = "#FFFFFF",

  red = "#ED6073",
  green = "#CBE697",
  blue = "#9CDCFB",
  yellow = "#F8CC7A",
  purple = "#CBA9EA",

  gray = "#A9AECC",
  darkgray = "#686E92",
}

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

local function highlight(hl, bg, fg, gui)
  vim.cmd(string.format("hi %s guibg=%s guifg=%s gui=%s", hl, bg, fg, gui or "NONE"))
end

local theme = {
  normal = {
    a = { bg = colors.black, fg = colors.green, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray, gui = "bold" },
    c = { bg = colors.black, fg = colors.gray },
    x = { bg = colors.black, fg = colors.gray },
    y = { bg = colors.black, fg = colors.gray, gui = "bold" },
    z = { bg = colors.black, fg = colors.gray, gui = "bold" },
  },
  insert = {
    a = { bg = colors.black, fg = colors.blue, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray, gui = "bold" },
    c = { bg = colors.black, fg = colors.gray },
    x = { bg = colors.black, fg = colors.gray },
    y = { bg = colors.black, fg = colors.gray, gui = "bold" },
    z = { bg = colors.black, fg = colors.gray, gui = "bold" },
  },
  visual = {
    a = { bg = colors.black, fg = colors.yellow, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray, gui = "bold" },
    c = { bg = colors.black, fg = colors.gray },
    x = { bg = colors.black, fg = colors.gray },
    y = { bg = colors.black, fg = colors.gray, gui = "bold" },
    z = { bg = colors.black, fg = colors.gray, gui = "bold" },
  },
  replace = {
    a = { bg = colors.black, fg = colors.red, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray, gui = "bold" },
    c = { bg = colors.black, fg = colors.gray },
    x = { bg = colors.black, fg = colors.gray },
    y = { bg = colors.black, fg = colors.gray, gui = "bold" },
    z = { bg = colors.black, fg = colors.gray, gui = "bold" },
  },
  command = {
    a = { bg = colors.black, fg = colors.green, gui = "bold" },
    b = { bg = colors.black, fg = colors.gray, gui = "bold" },
    c = { bg = colors.black, fg = colors.gray },
    x = { bg = colors.black, fg = colors.gray },
    y = { bg = colors.black, fg = colors.gray, gui = "bold" },
    z = { bg = colors.black, fg = colors.gray, gui = "bold" },
  },
  inactive = {
    a = { bg = colors.darkblack, fg = colors.darkgray },
    b = { bg = colors.darkblack, fg = colors.darkgray },
    c = { bg = colors.darkblack, fg = colors.darkgray },
    x = { bg = colors.darkblack, fg = colors.darkgray },
    y = { bg = colors.darkblack, fg = colors.darkgray },
    z = { bg = colors.darkblack, fg = colors.darkgray },
  },
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { "", "" },
    section_separators = { "", "" },
    disabled_filetypes = { "NvimTree" },
    left_padding = 0,
    right_padding = 0,
  },
  sections = {

    lualine_a = {
      {
        function()
          return "┃"
        end,
        right_padding = 1,
        color = { bg = colors.black, fg = colors.purple, gui = "bold" },
      },
      {
        function()
          return ""
        end,
        right_padding = 2,
      },
    },
    lualine_b = {
      {
        function()
          if vim.bo.readonly then
            highlight("LualineFileStateIcon", colors.black, colors.yellow, "bold")
            return " "
          elseif vim.bo.modifiable and vim.bo.modified then
            highlight("LualineFileStateIcon", colors.black, colors.red, "bold")
            return " "
          else
            return ""
          end
        end,
        color = "LualineFileStateIcon",
      },
      {
        function()
          if vim.bo.modifiable and vim.bo.modified then
            highlight("LualineSimpleCurrentDirectory", colors.black, colors.red, "bold")
          else
            highlight("LualineSimpleCurrentDirectory", colors.black, colors.green, "bold")
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
        color = "LualineSimpleCurrentDirectory",
      },
      {
        function()
          if vim.bo.modifiable and vim.bo.modified then
            highlight("LualineFileName", colors.black, colors.red, "bold")
          else
            highlight("LualineFileName", colors.black, colors.gray, "bold")
          end

          local file_name = vim.fn.expand "%:t"
          if file_name == "" then
            return "[No Name]"
          else
            return file_name
          end
        end,
        color = "LualineFileName",
        right_padding = 2,
      },
    },
    lualine_c = {
      {
        function()
          return "%l:%c"
        end,
        right_padding = 1,
      },
      {
        function()
          return "%P"
        end,
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        function()
          return vim.bo.filetype
        end,
        right_padding = 2,
        color = { bg = colors.black, fg = colors.blue, gui = "bold" },
      },
      -- git
      {
        "branch",
        icon = "",
        right_padding = 1,
        color = { bg = colors.black, fg = colors.green, gui = "bold" },
      },
      -- lsp
      {
        function()
          local error = get_nvim_lsp_diagnostic "Error"
          local warning = get_nvim_lsp_diagnostic "Warning"

          if error > warning then
            highlight("LualineDiagnosticIcon", colors.black, colors.red, "bold")
            return ""
          elseif warning > 0 then
            highlight("LualineDiagnosticIcon", colors.black, colors.yellow, "bold")
            return "!"
          else
            highlight("LualineDiagnosticIcon", colors.black, colors.green, "bold")
            return ""
          end
        end,
        color = "LualineDiagnosticIcon",
        right_padding = 1,
      },
      {
        function()
          return get_nvim_lsp_diagnostic "Error" .. ""
        end,
        color = { bg = colors.black, fg = colors.red, gui = "bold" },
      },
      {
        function()
          return "/"
        end,
        color = { bg = colors.black, fg = colors.gray },
      },
      {
        function()
          return get_nvim_lsp_diagnostic "Warning" .. ""
        end,
        color = { bg = colors.black, fg = colors.yellow, gui = "bold" },
      },
      {
        function()
          return "/"
        end,
        color = { bg = colors.black, fg = colors.gray },
      },
      {
        function()
          return get_nvim_lsp_diagnostic "Information" + get_nvim_lsp_diagnostic "Hint" .. ""
        end,
        right_padding = 1,
        color = { bg = colors.black, fg = colors.green, gui = "bold" },
      },
    },
  },
  inactive_sections = {

    lualine_a = {
      {
        function()
          return "┃"
        end,
        right_padding = 1,
        color = { bg = colors.darkblack, fg = colors.darkgray },
      },
      {
        function()
          return ""
        end,
        right_padding = 2,
      },
    },
    lualine_b = {
      {
        function()
          if vim.bo.readonly then
            return " "
          elseif vim.bo.modifiable and vim.bo.modified then
            return " "
          else
            return ""
          end
        end,
      },
      {
        function()
          local currentDir = vim.fn.expand "%:h"
          local separator = string.byte "/"
          for i = #currentDir, 1, -1 do
            if currentDir:byte(i) == separator then
              return currentDir:sub(i + 1, #currentDir) .. "/"
            end
          end
          return ""
        end,
      },
      {
        function()
          local file_name = vim.fn.expand "%:t"
          if file_name == "" then
            return "[No Name]"
          else
            return file_name
          end
        end,
        right_padding = 2,
      },
    },
    lualine_c = {
      {
        function()
          return "%l:%c"
        end,
        right_padding = 1,
      },
      {
        function()
          return "%P"
        end,
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        function()
          return vim.bo.filetype
        end,
        right_padding = 1,
      },
      -- git
      {
        "branch",
        icon = "",
        right_padding = 1,
      },
      -- lsp
      {
        function()
          local error = get_nvim_lsp_diagnostic "Error"
          local warning = get_nvim_lsp_diagnostic "Warning"

          if error > warning then
            return ""
          elseif warning > 0 then
            return "!"
          else
            return ""
          end
        end,
        right_padding = 1,
      },
      {
        function()
          return get_nvim_lsp_diagnostic "Error" .. ""
        end,
      },
      {
        function()
          return "/"
        end,
      },
      {
        function()
          return get_nvim_lsp_diagnostic "Warning" .. ""
        end,
      },
      {
        function()
          return "/"
        end,
      },
      {
        function()
          return get_nvim_lsp_diagnostic "Information" + get_nvim_lsp_diagnostic "Hint" .. ""
        end,
        right_padding = 1,
      },
    },
  },
  tabline = {},
  extensions = {},
}
