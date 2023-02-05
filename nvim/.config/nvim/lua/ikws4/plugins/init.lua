return {
  {
    "numToStr/Comment.nvim",
    config = {
      mappings = {
        extra = false,
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = {
      mapping = { "jk" },
    },
  },

  "tpope/vim-surround",

  {
    "j-hui/fidget.nvim",
    config = {
      text = {
        spinner = "dots",
      },
      window = {
        relative = "editor",
      },
      fmt = {
        stack_upwards = false,
      },
      sources = {
        ["jdtls"] = {
          ignore = true,
        },
      },
    },
  },

  {
    "beauwilliams/focus.nvim",
    keys = {
      { "<leader>wn", "<cmd>FocusSplitNicely<cr><cmd>Telescope find_files hidden=true<cr>" },
      { "<leader>wf", "<cmd>FocusMaxOrEqual<cr>", desc = "Maximize current buffer" },
    },
    config = {
      autoresize = false,
      cursorline = false,
      signcolumn = false,
      winhighlight = false,
      bufnew = true,
    },
  },

  {
    "akinsho/git-conflict.nvim",
    config = {
      highlights = {
        current = "DiffText",
        incoming = "DiffAdd",
        ancestor = "DiffChanged",
      },
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gg", "<cmd>tab Git<cr>", desc = "Open git" },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "neovim/nvim-lspconfig",
    },
  },
}
