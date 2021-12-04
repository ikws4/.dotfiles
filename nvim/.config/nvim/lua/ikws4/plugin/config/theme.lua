local cmd = vim.cmd

vim.o.fillchars = "eob: ,vert:|"
vim.g.rose_pine_variant = "moon"
vim.g.rose_pine_disable_italics = true

local function hi(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  vim.cmd(hl)
  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  end
end

function _G.themeOverride()
  local p = require "rose-pine.palette"

  local theme = {
    VertSplit = { fg = p.inactive, bg = p.surface },
    FloatBorder = { fg = p.base, bg = p.base },
    NormalFloat = { bg = p.surface },
    TelescopeBorder = { fg = p.base, bg = p.base },
    StatusLine = { fg = p.text, bg = p.base },
    StatusLineNC = { fg = p.subtle, bg = p.base },
    UnfocusedWindow = { link = "DarkenedPanel" },
    FocusedWindow = { link = "Normal" },
    LightBulbFloatWin = { fg = "#FFCC01" },
    Visual = { bg = p.highlight_low },

    -- nvim-tree
    NvimTreeExecFile = { fg = p.pine, style = "italic" },
  }

  for group, color in pairs(theme) do
    hi(group, color)
  end
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
