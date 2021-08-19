local actions = require "telescope.actions"
local themes = require "telescope.themes"

local lsp_preview_theme = themes.get_ivy {
  layout_config = {
    height = 0.4,
  },
}

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case",
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
        ["q"] = actions.close,
      },
    },
    borderchars = {
      { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    prompt_prefix = "❯ ",
    selection_caret = " ",
  },
  pickers = {
    lsp_references = lsp_preview_theme,
    lsp_definitions = lsp_preview_theme,
    lsp_implementations = lsp_preview_theme,
    lsp_workspace_diagnostics = lsp_preview_theme,
    lsp_code_actions = themes.get_cursor(),
    file_browser = {
      sorting_strategy = "ascending",
      hidden = true,
      layout_config = {
        prompt_position = 'top',
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
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
