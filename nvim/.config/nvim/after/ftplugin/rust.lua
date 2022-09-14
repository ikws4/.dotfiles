vim.keymap.set("i", "<M-CR>",function ()
  local line = vim.api.nvim_get_current_line()
  return line:sub(#line, #line) == ";" and "<End><Enter>" or "<End>;<Enter>"
end , { expr = true })
