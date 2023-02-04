return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  keys = {
    {"<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", "File files"},
    {"<leader>sh", "<cmd>Telescope help_tags<cr>", "Search helps"},
    {"<leader>sp", "<cmd>Telescope live_grep<cr>", "Search project (live grep)"},
    {"/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer"},
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local themes = require "telescope.themes"

    local ivy_theme = themes.get_ivy {
      layout_config = {
        height = 0.55,
        preview_width = 0.4,
      },
    }

    local dropdown_theme = themes.get_dropdown {
      layout_config = {
        anchor = "N",
        width = 0.6,
        height = 0.7,
      },
      previewer = false,
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
          "^node_modules/",
          "^vendor/",
          "^.git/",
          ".DS_Store",
          ".gradle/",
          "gradle/",
          ".idea/",
          ".settings/",
          "eclipse_dependencies/",
        },
        mappings = {
          i = {
            ["<C-x>"] = false,
            ["<C-s>"] = actions.file_split,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["q"] = actions.close,
            ["<C-x>"] = false,
            ["<C-s>"] = actions.file_split,
          },
        },
        prompt_prefix = " ",
        selection_caret = "  ",
        path_display = { "absolute" },
      },
      pickers = {
        lsp_references = ivy_theme,
        lsp_definitions = ivy_theme,
        lsp_implementations = ivy_theme,
        lsp_document_symbols = dropdown_theme,
        diagnostics = ivy_theme,
        find_files = dropdown_theme,
        current_buffer_fuzzy_find = ivy_theme,
        help_tags = dropdown_theme,
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
  end,
}
