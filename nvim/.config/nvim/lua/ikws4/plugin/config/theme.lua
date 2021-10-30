local cmd = vim.cmd

vim.o.fillchars = "eob: ,vert:|"
vim.g.rose_pine_variant = "moon"

function _G.themeOverride()
  local p = require "rose-pine.palette"
  local hi = require("rose-pine.util").highlight

  hi("VertSplit", { fg = p.inactive, bg = p.surface })
  hi("FloatBorder", { fg = p.base, bg = p.base })
  hi("NormalFloat", { bg = p.surface })
  hi("TelescopeBorder", { fg = p.base, bg = p.base })
  hi("StatusLine", { fg = p.text, bg = p.base })
  hi("StatusLineNC", { fg = p.subtle, bg = p.base })

  hi("UnfocusedWindow", { link = "DarkenedPanel" })
  hi("FocusedWindow", { link = "Normal" })

  hi("LightBulbFloatWin", { fg = "#FFCC01" })
end

-- Highlight on yank
cmd [[
  augroup TextyankPostAutoGroup
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank { higroup = 'Visual',timeout = 350 }
  augroup END
]]

-- Theme Override
cmd [[
  augroup ThemeOverride
    autocmd!
    autocmd ColorScheme rose-pine lua themeOverride()
  augroup END
]]

cmd [[ colorscheme rose-pine ]]
