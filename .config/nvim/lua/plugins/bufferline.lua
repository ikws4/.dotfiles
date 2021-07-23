return function()
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  require("bufferline").setup {
    options = {
      numbers = "none",
      number_style = "",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          padding = 1,
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
    },
  }

  map("n", "[b", [[<cmd>BufferLineCycleNext<CR>]], opts)
  map("n", "]b", [[<cmd>BufferLineCyclePrev<CR>]], opts)
  map("n", "<leader><leader>", [[<cmd>BufferLinePick<CR>]], opts)
end
