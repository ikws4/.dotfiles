return function()
  local tabline_hl = {
    guifg = {
      attribute = "fg",
      highlight = "TabLine"
    },
    guibg = {
      attribute = "bg",
      highlight = "TabLine"
    },
  }
  local tabline_sel = {
    guifg = {
      attribute = "fg",
      highlight = "TabLineSel"
    },
    guibg = {
      attribute = "bg",
      highlight = "TabLineSel"
    },
    gui = "bold",
  }

  require("bufferline").setup {
    options = {
      numbers = "none",
      number_style = "none",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          padding = 1,
          text_align = "center"
        }
      },
      indicator_icon = " ",
      max_name_length = 30,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      persist_buffer_sort = true,
      separator_style = { "", "" },
      enforce_regular_tabs = false,
      always_show_bufferline = true,

    },
    highlights = {
      fill = tabline_hl,
      background = tabline_hl,
      buffer_selected = tabline_sel,
      modified = tabline_hl,
      modified_selected = tabline_sel,
      indicator_selected = tabline_sel,
    }
  }

  as.nnoremap("<TAB>", "<cmd>BufferLineCycleNext<CR>")
  as.nnoremap("<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
end
