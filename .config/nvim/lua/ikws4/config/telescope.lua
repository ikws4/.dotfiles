local telescope = require "telescope"
local actions = require "telescope.actions"
local themes = require "telescope.themes"

local lsp_preview_theme = themes.get_ivy {
  layout_config = {
    height = 0.4,
  },
}

telescope.setup {
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
        ["<Esc>"] = actions.close,
      },
    },
    borderchars = {
      { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    prompt_prefix = " ",
    selection_caret = " ",
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

telescope.load_extension "fzf"