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
    config = function()
      require("focus").setup {
        autoresize = false,
        cursorline = false,
        signcolumn = false,
        winhighlight = false,
        bufnew = true,
        excluded_filetypes = { "harpoon" },
      }

      vim.keymap.set("n", "<leader>wn", "<Cmd>FocusSplitNicely<CR><Cmd>Telescope find_files hidden=true<CR>")
      vim.keymap.set("n", "<leader>wf", "<Cmd>FocusMaxOrEqual<CR>")
    end,
  }
  -- }}}

  -- Motion {{{
  use {
    "rlane/pounce.nvim",
    config = function()
      require("pounce").setup {
        accept_keys = ";FKDLSAHGNUVRBYTMICEOXWPQZ",
        accept_best_key = ";",
      }

      vim.keymap.set("n", "s", "<Cmd>Pounce<CR>")
      vim.keymap.set("n", "S", "<Cmd>Pounce<CR>")
    end,
  }
  -- }}}

  -- Util {{{
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }

  use {
    "hkupty/iron.nvim",
    config = function()
      local view = require "iron.view"
      vim.g.iron_map_defaults = false
      vim.g.iron_map_extended = false

      vim.keymap.set("n", "<localleader>;", "<Plug>(iron-send-line)", { remap = true })
      vim.keymap.set("n", "<localleader>e", "<Plug>(iron-repeat-cmd)", { remap = true })
      vim.keymap.set("v", ";", "<Plug>(iron-visual-send)", { remap = true })
      vim.keymap.set("n", "<localleader>c", "<Plug>(iron-clear)", { remap = true })

      require("iron").core.set_config {
        highlight_last = "CursorColumn",
        repl_open_cmd = function(buffer)
          local api = vim.api
          local win_id = view.openwin("rightbelow 10 split", buffer)

          api.nvim_win_set_option(win_id, "number", false)
          api.nvim_win_set_option(win_id, "relativenumber", false)
          api.nvim_win_set_option(win_id, "signcolumn", "no")
          vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = buffer })

          return win_id
        end,
      }
    end,
  }

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup({ "*" }, { names = false })
    end,
  }

  use {
    "numtostr/FTerm.nvim",
    module = "FTerm",
    setup = function()
      -- stylua: ignore start
      vim.keymap.set("n", "<leader>m", function() require("FTerm").open() end)
      vim.keymap.set("t", "<esc>", function() require("FTerm").close() end)
      -- stylua: ignore end
    end,
    config = function()
      require("FTerm").setup {
        hl = "Normal",
        border = "rounded",
        dimensions = {
          height = 0.88,
          width = 0.78,
          x = 0.43,
          y = 0.3,
        },
      }
    end,
  }

  use {
    "nvim-neorg/neorg",
    config = conf "norg",
  }

  use {
    "jbyuki/venn.nvim",
    config = function()
      -- toggle keymappings for venn using <leader>v
      vim.keymap.set("n", "<leader>v", function()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd [[setlocal ve=all]]
          -- draw a line on HJKL keystokes
          vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", { buffer = 0 })
          vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", { buffer = 0 })
          vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", { buffer = 0 })
          vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", { buffer = 0 })

          -- draw a box by pressing "f" with visual selection
          vim.keymap.set("v", "f", ":VBox<CR>", { buffer = 0 })
        else
          vim.cmd [[setlocal ve=]]
          vim.cmd [[mapclear <buffer>]]
          vim.b.venn_enabled = nil
        end
      end)
    end,
  }
  -- }}}

  -- Treesitter {{{
  use {
    "nvim-treesitter/nvim-treesitter",
    config = conf "nvim_treesitter",
  }

  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
  }

  use {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    after = "nvim-treesitter",
  }

  -- }}}

  -- Git {{{
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    setup = function()
      vim.keymap.set("n", "<leader>gg", "<Cmd>Neogit<CR>")
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
        mappings = {
          status = {
            ["<Esc>"] = "Close",
          },
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
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {
        text = {
          spinner = "dots",
        },
        window = {
          relative = "editor",
        },
        fmt = {
          leftpad = true,
          stack_upwards = false,
          max_width = 0,
          fidget = function(fidget_name, spinner)
            return string.format("%s %s ", spinner, fidget_name)
          end,
          task = function(task_name, message, percentage)
            return string.format(
              "%s%s [%s] ",
              message,
              percentage and string.format(" (%s%%)", percentage) or "",
              task_name
            )
          end,
        },
      }
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      local null_ls = require "null-ls"
      local utils = require "ikws4.plugin.config.lsp.utils"

      null_ls.setup {
        on_attach = utils.on_attach,
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
    "folke/lua-dev.nvim",
  }

  use "mfussenegger/nvim-jdtls"

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
    branch = "dev",
    commit = "8428166e308b5bad9cfee55f850de8b6a2f2b1ce",
    wants = "lspkind-nvim",
    config = conf "nvim_cmp",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
  }

  use {
    "github/copilot.vim",
    config = function()
      vim.keymap.set("i", "<C-J>", "copilot#Accept('')", { silent = true, expr = true, remap = true })
      vim.g.copilot_no_tab_map = true
    end,
  }

  -- }}}

  -- Editing support {{{
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      local npairs = require "nvim-autopairs"
      npairs.setup()

      npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end,
  }

  use {
    "windwp/nvim-ts-autotag",
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
        -- clear_empty_lines = true,
      }
    end,
  }

  use "tpope/vim-surround"
  -- }}}

  -- File navigation {{{
  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    setup = function()
      vim.keymap.set("n", "<leader>n", "<Cmd>NvimTreeToggle<CR>")
    end,
    config = conf "nvim_tree",
  }

  use {
    "nvim-telescope/telescope.nvim",
    -- module = "telescope",
    -- cmd = "Telescope",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    setup = function()
      -- stylua: ignore start
      vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files hidden=true<CR>")
      vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>")
      vim.keymap.set("n", "<leader>bb", "<Cmd>Telescope buffers<CR>")
      vim.keymap.set("n", "<leader>sh", "<Cmd>Telescope help_tags<CR>")
      vim.keymap.set("n", "<leader>sp", "<Cmd>Telescope live_grep<CR>")
      vim.keymap.set("n", "/", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
      -- stylua: ignore end
    end,
    config = conf "telescope",
  }

  use {
    "ThePrimeagen/harpoon",
    config = function()
      -- stylua: ignore start
      vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end)
      vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end)
      vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end)
      vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end)
      vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
      vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
      vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
      vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
      vim.keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
      vim.keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
      -- stylua: ignore end
    end,
  }
  -- }}}
end)
