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
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

require("telescope").load_extension "fzf"

-- maps
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
-- map("n", "<leader><leader>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
-- map("n", "<leader>sw", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
-- map(
--   "n",
--   "<leader>sf",
--   [[<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>]],
--   opts
-- )
-- map(
--   "n",
--   "<leader>sh",
--   [[<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer = false}))<CR>]],
--   opts
-- )
-- map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], opts)
-- map("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
