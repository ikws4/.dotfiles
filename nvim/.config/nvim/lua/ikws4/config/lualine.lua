local lsp_status = require "lsp-status"

local disable_filetypes = { "NvimTree" }

require("lualine").setup {
  options = {
    section_separators = { "", "" },
    component_separators = { "", "" },
    theme = "rose-pine",
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
      lsp_status.status_progress,
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
