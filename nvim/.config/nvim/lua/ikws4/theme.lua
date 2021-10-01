vim.o.fillchars = "eob: ,vert: "
vim.g.rose_pine_variant = "moon"
vim.g.rose_pine_bold_vertical_split_line = true

function _G.themeOverride()
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
