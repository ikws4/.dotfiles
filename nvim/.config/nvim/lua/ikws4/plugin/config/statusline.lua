local p = require "rose-pine.palette"

local theme = {
  normal = {
    a = { bg = p.rose, fg = p.surface, gui = "bold" },
    b = { bg = p.surface, fg = p.rose },
    c = { bg = p.base, fg = p.text },
  },
  insert = {
    a = { bg = p.foam, fg = p.surface, gui = "bold" },
    b = { bg = p.surface, fg = p.foam },
    c = { bg = p.base, fg = p.text },
  },
  visual = {
    a = { bg = p.iris, fg = p.surface, gui = "bold" },
    b = { bg = p.surface, fg = p.iris },
    c = { bg = p.base, fg = p.text },
  },
  replace = {
    a = { bg = p.pine, fg = p.surface, gui = "bold" },
    b = { bg = p.surface, fg = p.pine },
    c = { bg = p.base, fg = p.text },
  },
  command = {
    a = { bg = p.love, fg = p.surface, gui = "bold" },
    b = { bg = p.surface, fg = p.love },
    c = { bg = p.base, fg = p.text },
  },
  inactive = {
    a = { bg = p.base, fg = p.inactive, gui = "bold" },
    b = { bg = p.base, fg = p.inactive },
    c = { bg = p.base, fg = p.inactive },
  },
}

require("lualine").setup {
  options = {
    section_separators = { "", "" },
    component_separators = { "", "" },
    disabled_filetypes = { "NvimTree" },
    theme = theme,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      {
        "diff",
        padding = {
          left = 0,
          right = 1,
        },
      },
    },
    lualine_c = {
      {
        "filename",
        path = 0,
      },
      {
        "%p%%",
        padding = {
          left = 0,
          right = 1,
        }
      },
    },
    lualine_x = {
      "filetype",
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        always_visible = false,
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
