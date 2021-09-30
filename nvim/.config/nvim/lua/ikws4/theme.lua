vim.o.fillchars = "eob: ,"
vim.g.rose_pine_variant = 'moon'
vim.g.rose_pine_bold_vertical_split_line = true

-- Highlight on yank
vim.cmd [[
  augroup TextyankPostAutoGroup
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank { higroup = 'Visual',timeout = 350 }
  augroup END
]]

vim.cmd('colorscheme rose-pine')
