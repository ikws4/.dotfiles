local cmd = vim.cmd

-- Theme Override
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local p = require "rose-pine.palette"
    local hi = require("rose-pine.util").highlight

    local theme = {
      VertSplit = { fg = p.overlay, bg = p.base },
      StatusLine = { fg = p.text, bg = p.base },
      StatusLineNC = { fg = p.subtle, bg = p.base },
      Visual = { bg = p.highlight_low },
      Pmenu = { fg = p.subtle, bg = p.surface },
      TermCursor = { link = "Cursor" },
      FoldColumn = { fg = p.base, bg = p.base },
      MatchParen = { fg = p.subtle, bg = p.base },

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

      -- telescope
      TelescopeSelection = { link = "Visual" },
      TelescopeSelectionCaret = { fg = p.rose, bg = p.highlight_low },
      TelescopeResultsSpecialComment = { link = "LineNr" },

      -- neotree
      NeoTreeExpander = { fg = p.subtle },
      NeoTreeDimText = { fg = p.muted },
      NeoTreeDotfile = { link = "NeoTreeDimText" },
      NeoTreeFileIcon = { fg = p.text },
    }

    for group, color in pairs(theme) do
      hi(group, color)
    end
  end,
  pattern = "rose-pine",
  group = vim.api.nvim_create_augroup("ThemeOverride", {}),
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {
      higroup = "Visual",
      timeout = 350,
    }
  end,
  group = vim.api.nvim_create_augroup("HighlightOnYank", {}),
})

require("rose-pine").setup {
  dark_variant = "moon",
  disable_float_background = true,
  disable_italics = true,
}

cmd [[ colorscheme rose-pine ]]
