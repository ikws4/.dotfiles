vim.o.fillchars = "eob: ,vert: "
vim.g.rose_pine_variant = "moon"
vim.g.rose_pine_bold_vertical_split_line = true

function _G.themeOverride()
  -- TODO: Make PR to rose-pine
  vim.cmd("hi FloatBorder guibg=#232136 guifg=#59546d")
  vim.cmd("hi TelescopeBorder guifg=#59546d")
  vim.cmd("hi StatusLine guifg=#e0def4 guibg=#232136")
  vim.cmd("hi StatusLineNC guifg=#817c9c guibg=#232136")
  vim.cmd("hi! link NvimTreeNormal DarkenedPanel")
end

-- Highlight on yank
vim.cmd [[
  augroup TextyankPostAutoGroup
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank { higroup = 'Visual',timeout = 350 }
  augroup END
]]

-- Theme Override
vim.cmd [[
  augroup ThemeOverride
    autocmd!
    autocmd ColorScheme rose-pine lua themeOverride()
  augroup END
]]

vim.cmd "colorscheme rose-pine"
