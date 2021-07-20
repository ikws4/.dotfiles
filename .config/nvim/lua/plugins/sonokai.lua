return function()
  vim.o.termguicolors = true
  vim.g.sonokai_style = "andromeda"
  vim.g.sonokai_cursor = "auto"
  vim.g.sonokai_show_eob = 0
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_disable_italic_comment = 1
  vim.g.lightline = {
    colorscheme = "sonokai"
  }

  vim.cmd("colorscheme sonokai")

  -- Highlight on yank
  vim.api.nvim_exec(
    [[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    augroup end
    ]],
    false
  )
end
