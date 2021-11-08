local present, packer = pcall(require, "ikws4.plugin.packer_init")

if not present then
  return false
end

local use = packer.use

local conf = function(name)
  return "require('ikws4.plugin.config." .. name .. "')"
end

return packer.startup(function()
  -- Dependencies {{{
  use "wbthomason/packer.nvim"

  use "tjdevries/astronauta.nvim"

  use "nvim-lua/plenary.nvim"

  use "kyazdani42/nvim-web-devicons"
  -- }}}

  -- UI {{{
  use {
    "rose-pine/neovim",
    as = "rose-pine",
    config = conf "theme",
  }

  use {
    "nvim-lualine/lualine.nvim",
    after = "rose-pine",
    config = conf "statusline",
  }
  -- }}}

  -- Window {{{
  use {
    "beauwilliams/focus.nvim",
    cmd = { "FocusSplitNicely", "FocusMaximise", "FocusEqualise" },
    setup = function()
      local nnoremap = vim.keymap.nnoremap

      nnoremap { "<leader>wn", "<cmd>FocusSplitNicely<cr><cmd>Telescope find_files hidden=true<cr>" }
      nnoremap { "<leader>wf", "<cmd>FocusMaximise<cr>" }
      nnoremap { "<leader>w=", "<cmd>FocusEqualise<cr>" }

      vim.wo.winhighlight = "Normal:FocusedWindow,NormalNC:UnfocusedWindow,SignColumn:NvimTreeNormal"
    end,
    config = function()
      require("focus").setup {
        cursorline = false,
        signcolumn = false,
        winhighlight = true,
        bufnew = true,
      }
      vim.wo.winhighlight = "Normal:FocusedWindow,NormalNC:UnfocusedWindow,SignColumn:NvimTreeNormal"
    end,
  }

  use {
    "sindrets/winshift.nvim",
    cmd = "WinShift",
    setup = function()
      vim.keymap.nnoremap { "<leader>wm", "<cmd>WinShift<cr>" }
    end,
    config = function()
      require("winshift").setup {
        focused_hl_group = "Normal",
      }
    end,
  }
  -- }}}

  -- Motion {{{
  use {
    "ggandor/lightspeed.nvim",
  }
  -- }}}

  -- Util {{{
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup({ "*" }, { names = false })
    end,
  }

  use {
    "glepnir/dashboard-nvim",
    config = conf "dashboard",
  }

  use {
    "numtostr/FTerm.nvim",
    module = "FTerm",
    setup = function()
      vim.keymap.nnoremap { "<leader>m", "<cmd>lua require('FTerm').open()<cr>" }
      vim.keymap.tnoremap { "<esc>", "<cmd>lua require('FTerm').close()<cr>" }
    end,
    config = function()
      require("FTerm").setup {
        hl = "Normal",
        border = "solid",
        dimensions = {
          height = 0.88,
          width = 0.78,
          x = 0.45,
          y = 0.3,
        },
      }
    end,
  }
  -- }}}

  -- Treesitter {{{
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = conf "nvim_treesitter",
  }

  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  }

  use {
    "nvim-treesitter/nvim-treesitter-refactor",
    after = "nvim-treesitter",
    disable = true,
  }

  -- }}}

  -- Git {{{
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    setup = function()
      vim.keymap.nnoremap { "<leader>gg", "<cmd>Neogit<cr>" }
    end,
    config = function()
      require("neogit").setup {
        disable_commit_confirmation = true,
        disable_builtin_notifications = true,
        signs = {
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
      }
    end,
  }
  -- }}}

  -- LSP {{{
  use {
    "neovim/nvim-lspconfig",
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      local null_ls = require "null-ls"

      null_ls.config {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.autopep8,
          -- null_ls.builtins.formatting.uncrustify.with {
          --   extra_args = { "-c", "-" },
          -- },
        },
      }
    end,
  }

  use {
    "williamboman/nvim-lsp-installer",
    after = { "null-ls.nvim", "cmp-nvim-lsp" },
    config = conf "lsp",
  }

  use {
    "onsails/lspkind-nvim",
  }

  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    config = conf "luasnip",
  }

  use {
    "hrsh7th/nvim-cmp",
    wants = "lspkind-nvim",
    config = conf "nvim_cmp",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  }

  -- }}}

  -- Editing support {{{
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end,
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        mappings = {
          extra = false,
        },
      }
    end,
  }

  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jk" },
        clear_empty_lines = true,
      }
    end,
  }
  -- }}}

  -- File navigation {{{
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    setup = function()
      vim.keymap.nnoremap { "<leader>n", "<cmd>NvimTreeToggle<cr>" }
    end,
    config = conf "nvim_tree",
  }

  use {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = { { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
    setup = function()
      local nnoremap = vim.keymap.nnoremap

      nnoremap { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>" }
      nnoremap { "<leader>fr", "<cmd>Telescope oldfiles<cr>" }
      nnoremap { "<leader>bb", "<cmd>Telescope buffers<cr>" }
      nnoremap { "<leader>sh", "<cmd>Telescope help_tags<cr>" }
      nnoremap { "<leader>sp", "<cmd>Telescope live_grep<cr>" }
      nnoremap { "<leader>sm", "<cmd>Telescope marks<cr>" }
      nnoremap { "/", "<cmd>Telescope current_buffer_fuzzy_find<cr>" }
    end,
    config = conf "telescope",
  }
  -- }}}
end)
