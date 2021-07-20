return function()
  local actions = require "telescope.actions"

  require "telescope".setup {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
        }
      }
    }
  }

  local map = vim.api.nvim_set_keymap
  local opts = {noremap = true, silent = true}
  map("n", "<leader><space>", [[<cmd>Telescope buffers<CR>]], opts)
  map(
    "n",
    "<leader>sf",
    [[<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>]],
    opts
  )
  map("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
end
