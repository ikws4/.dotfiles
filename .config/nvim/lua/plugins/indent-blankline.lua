return function()
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_filetype_exclude = {
    "dashboard",
    "NvimTree",
    "help"
  }
end
