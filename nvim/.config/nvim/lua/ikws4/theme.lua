vim.o.fillchars = "eob: ,vert: "
vim.g.rose_pine_variant = "moon"
vim.g.rose_pine_bold_vertical_split_line = true

function _G.themeOverride()
  local p = require "rose-pine.palette"
  local hi = require("rose-pine.util").highlight

  -- TODO: Make PR to rose-pine
  hi("FloatBorder", { fg = p.inactive })
  hi("TelescopeBorder", { fg = p.inactive })
  hi("StatusLine", { fg = p.text, bg = p.surface })
  hi("StatusLineNC", { fg = p.subtle, bg = p.surface })
  -- vim.cmd("hi NvimTreeNormal guibg=#1f1d30")
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
