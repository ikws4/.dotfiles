local cmd = vim.cmd

vim.o.fillchars = "eob: ,"
function _G.themeOverride()
  local p = require "rose-pine.palette"
  local hi = require("rose-pine.util").highlight

  local theme = {
    VertSplit = { fg = p.muted, bg = p.base },
    -- FloatBorder = { link = "TelescopeBorder" },
    TelescopeBorder = { link = "FloatBorder" },
    -- NormalFloat = { bg = p.surface },
    -- TelescopeBorder = { fg = p.base, bg = p.base },
    StatusLine = { fg = p.text, bg = p.base },
    StatusLineNC = { fg = p.subtle, bg = p.base },
    -- UnfocusedWindow = { link = "DarkenedPanel" },
    -- FocusedWindow = { link = "Normal" },
    -- LightBulbFloatWin = { fg = "#FFCC01" },
    Visual = { bg = p.highlight_low },
    Pmenu = { fg = p.subtle, bg = p.surface },
    TermCursor = { link = "Cursor" },
    -- MatchParen = { bg = p.highlight_med },

    -- nvim-tree
    NvimTreeExecFile = { fg = p.pine, style = "italic" },

    -- nvim-cmp
    CmpItemKindText = { fg = p.text },
    CmpItemKindKeyword = { fg = p.text },
    CmpCompletionWindow = { fg = p.subtle },

    -- lightspeed
    LightSpeedGreyWash = { link = "Comment" },

    -- treesitter
    TSKeywordOperator = { fg = p.pine },

    -- copilot
    CopilotSuggestion = { link = "Comment" },

    -- neorg
    NeorgCodeBlock = { bg = p.base },

    -- harpoon
    HarpoonBorder = { link = "FloatBorder" },
    HarpoonWindow = { link = "Comment" },
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

require("rose-pine").setup {
  dark_variant = "moon",
  disable_float_background = true,
  disable_italics = true,
}

cmd [[ colorscheme rose-pine ]]
