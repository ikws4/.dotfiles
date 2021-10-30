local telescope = require "telescope"
local actions = require "telescope.actions"
local themes = require "telescope.themes"

local ivy_theme = themes.get_ivy {
  layout_config = {
    height = 0.55,
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
      "vendor",
      ".git",
      "p5.js",
      "p5.sound.js",
    },
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
      },
      n = {
        ["q"] = actions.close,
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
      },
    },
    -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    -- borderchars = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    prompt_prefix = " ",
    selection_caret = " ",
  },
  pickers = {
    lsp_references = ivy_theme,
    lsp_definitions = ivy_theme,
    lsp_implementations = ivy_theme,
    lsp_workspace_diagnostics = ivy_theme,
    lsp_code_actions = themes.get_cursor(),
    current_buffer_fuzzy_find = ivy_theme,
    file_browser = {
      sorting_strategy = "ascending",
      hidden = true,
      layout_config = {
        prompt_position = "top",
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
