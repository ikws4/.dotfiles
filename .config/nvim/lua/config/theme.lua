vim.o.fillchars = "eob: ,"
vim.g.sonokai_style = "atlantis"
vim.g.sonokai_show_eob = 0
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_diagnostic_text_highlight = 1

function _G.sonokai_custom()
  vim.cmd "hi! VertSplit guifg=#282B3C"
  vim.cmd "hi! StatusLine guibg=#232633"
  vim.cmd "hi! StatusLineNC guibg=NONE"

  -- WhickKey
  vim.cmd "hi! link WhichKeyFloat StatusLine"

  -- Neogit
  vim.cmd "hi! NeogitDiffContextHighlight guibg=#282B3C guifg=#686E92"
end

vim.cmd [[
  augroup SonokaiCustom
    autocmd!
    autocmd ColorScheme sonokai call v:lua.sonokai_custom() 
  augroup END
]]

vim.cmd [[colorscheme sonokai]]
