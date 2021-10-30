-- local lsp_status = require "lsp-status"
local p = require "rose-pine.palette"

local disable_filetypes = { "NvimTree" }

local theme = {
  normal = {
    a = { bg = p.rose, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.rose },
    c = { bg = p.base, fg = p.text },
  },
  insert = {
    a = { bg = p.foam, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.foam },
    c = { bg = p.base, fg = p.text },
  },
  visual = {
    a = { bg = p.iris, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.iris },
    c = { bg = p.base, fg = p.text },
  },
  replace = {
    a = { bg = p.pine, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.pine },
    c = { bg = p.base, fg = p.text },
  },
  command = {
    a = { bg = p.love, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.love },
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
    theme = theme,
  },
  extensions = {
    {
      filetypes = disable_filetypes,
      sections = {},
    },
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
        left_padding = 0,
      },
    },
    lualine_c = {
      {
        "filename",
        path = 1,
      },
      "progress",
    },
    lualine_x = {
      -- lsp_status.status_progress,
      "filetype",
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = "E", warn = "W", info = "I", hint = "H" },
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
