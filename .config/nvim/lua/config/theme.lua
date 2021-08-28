vim.g.rose_pine_variant = 'moon'

-- Highlight on yank
vim.cmd [[
  augroup TextyankPostAutoGroup
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank { higroup = 'Visual',timeout = 350 }
  augroup END
]]

vim.cmd('colorscheme rose-pine')







-- local cmd = vim.cmd

-- vim.o.fillchars = "eob: ,"
-- vim.g.sonokai_style = "andromeda"
-- vim.g.sonokai_show_eob = 0
-- vim.g.sonokai_transparent_background = 0
-- vim.g.sonokai_menu_selection_background = 'green'
-- vim.g.sonokai_enable_italic = 1
-- vim.g.sonokai_disable_italic_comment = 1

-- function _G.sonokai_custom()
--   -- Editor
--   cmd [[hi! VertSplit guibg=#33364A guifg=#33364A]]
--   cmd [[hi! StatusLine guibg=#33364A]]
--   cmd [[hi! Cursor guibg=black guifg=white]]

--   -- WhickKey
--   cmd [[hi! WhichKeyFloat guibg=#232633]]

--   -- Neogit
--   cmd [[hi! NeogitDiffContextHighlight guibg=#282B3C guifg=#686E92]]
-- end

-- cmd [[
--   augroup SonokaiCustom
--     autocmd!
--     autocmd ColorScheme sonokai call v:lua.sonokai_custom() 
--   augroup END
-- ]]


-- cmd [[colorscheme sonokai]]

