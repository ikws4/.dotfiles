return {
  {
    "numToStr/Comment.nvim",
    opts = {
      mappings = {
        extra = false,
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      mapping = { "jk" },
    },
  },

  "tpope/vim-surround",
  "tpope/vim-repeat",
  {
    "tpope/vim-unimpaired",
    config = function()
      vim.cmd [[set completeopt-=preview]]
    end,
  },

  {
    "j-hui/fidget.nvim",
    opts = {
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
    opts = {
      autoresize = false,
      cursorline = false,
      signcolumn = false,
      winhighlight = false,
      bufnew = true,
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "jakewvincent/mkdnflow.nvim",
    opts = {

    }
  },
}
