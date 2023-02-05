return {
  "rose-pine/neovim",
  priority = 1000,
  config = function()
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
          FloatTitle = { fg = p.subtle },
          PmenuThumb = { bg = p.highlight_med },

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
          ["@keyword.operator"] = { fg = p.pine },
          ["@type.qualifier"] = { fg = p.pine },

          -- codeium
          CodeiumSuggestion = { link = "Comment" },

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
          NeoTreeMessage = { fg = p.muted },
          NeoTreeDotfile = { link = "NeoTreeDimText" },
          NeoTreeFileIcon = { fg = p.text },
          NeoTreeFloatBorder = { link = "TelescopeBorder" },
          NeoTreeFloatTitle = { link = "TelescopeTitle" },
        }

        for group, color in pairs(theme) do
          hi(group, color)
        end
      end,
      pattern = "rose-pine",
    })

    require("rose-pine").setup {
      dark_variant = "moon",
      disable_float_background = true,
      disable_italics = true,
    }

    vim.cmd [[ colorscheme rose-pine ]]
  end,
}
