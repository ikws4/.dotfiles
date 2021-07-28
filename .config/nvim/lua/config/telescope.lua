local actions = require "telescope.actions"

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
}

-- maps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader><leader>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
map(
  "n",
  "<leader>sf",
  [[<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>]],
  opts
)
map(
  "n",
  "<leader>sh",
  [[<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer = false}))<CR>]],
  opts
)
map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], opts)
map("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
