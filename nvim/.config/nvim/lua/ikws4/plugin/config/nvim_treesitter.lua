require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "java",
    "json",
    "javascript",
    "typescript",
    "bash",
    "toml",
    "lua",
  },
  highlight = {
    enable = true,
  },
  -- refactor = {
  --   smart_rename = {
  --     enable = false,
  --     keymaps = {
  --       smart_rename = "<leader>lr",
  --     },
  --   },
  --   navigation = {
  --     enable = false,
  --     keymaps = {
  --       goto_definition = "gd",
  --     },
  --   },
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
