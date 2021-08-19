vim.o.fillchars = "eob: ,"
vim.g.sonokai_style = "andromeda"
vim.g.sonokai_show_eob = 0
vim.g.sonokai_transparent_background = 0

function _G.sonokai_custom()
  vim.cmd "hi! VertSplit guibg=#33364A guifg=#33364A"

  vim.cmd "hi! WhichKeyFloat guibg=#232633"

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
