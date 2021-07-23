return function()
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_filetype_exclude = {
    "dashboard",
    "NvimTree",
    "help",
    "packer",
    "Outline",
  }
  vim.g.indent_blankline_buftype_exclude = {
    "terminal",
  }
end
