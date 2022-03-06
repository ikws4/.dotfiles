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
    config = function()
      require("focus").setup {
        cursorline = false,
        signcolumn = false,
        winhighlight = false,
        bufnew = true,
        excluded_filetypes = { "harpoon" },
      }

      local nnoremap = vim.keymap.nnoremap

      nnoremap { "<leader>wn", "<cmd>FocusSplitNicely<cr><cmd>Telescope find_files hidden=true<cr>" }
      nnoremap { "<leader>wf", "<cmd>FocusMaximise<cr>" }
      nnoremap { "<leader>w=", "<cmd>FocusEqualise<cr>" }
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
        focused_hl_group = "Visual",
      }
    end,
  }
  -- }}}

  -- Motion {{{
  use {
    "ggandor/lightspeed.nvim",
    disable = true,
  }

  use {
    "rlane/pounce.nvim",
    config = function()
      require("pounce").setup {
        accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
        -- accept_best_key = ";",
      }

      vim.keymap.nnoremap { "s", "<cmd>Pounce<cr>" }
      vim.keymap.nnoremap { "S", "<cmd>Pounce<cr>" }
    end,
  }
  -- }}}

  -- Util {{{
  use {
    "hkupty/iron.nvim",
    config = function()
      local view = require "iron.view"
      vim.g.iron_map_defaults = false
      vim.g.iron_map_extended = false

      vim.cmd [[
        nmap <localleader>;    <Plug>(iron-send-line)
        nmap <localleader>e    <Plug>(iron-repeat-cmd)
        vmap ;                 <Plug>(iron-visual-send)
        nmap <localleader>c    <Plug>(iron-clear)
      ]]

      require("iron").core.set_config {
        highlight_last = "CursorColumn",
        repl_open_cmd = function(buffer)
          local api = vim.api
          local win_id = view.openwin("rightbelow 10 split", buffer)

          api.nvim_win_set_option(win_id, "number", false)
          api.nvim_win_set_option(win_id, "relativenumber", false)
          api.nvim_win_set_option(win_id, "signcolumn", "no")
          vim.keymap.tnoremap { "<Esc>", [[<C-\><C-n>]], buffer = buffer }

          vim.cmd [[
            autocmd BufWinEnter,WinEnter term://* startinsert
          ]]

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
    "glepnir/dashboard-nvim",
    disable = true,
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
      -- venn.nvim: enable or disable keymappings
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd [[setlocal ve=all]]
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
        else
          vim.cmd [[setlocal ve=]]
          vim.cmd [[mapclear <buffer>]]
          vim.b.venn_enabled = nil
        end
      end
      -- toggle keymappings for venn using <leader>v
      vim.api.nvim_set_keymap("n", "<localleader>v", ":lua Toggle_venn()<CR>", { noremap = true })
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
    "nvim-treesitter/nvim-treesitter-refactor",
    after = "nvim-treesitter",
    disable = true,
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
      vim.cmd [[
        imap <silent><script><expr> <C-J> copilot#Accept("")
      ]]
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

  -- use {
  --   "blackCauldron7/surround.nvim",
  --   config = function()
  --     require("surround").setup {
  --       load_keymaps = false,
  --     }
  --
  --     local xnoremap = vim.keymap.xnoremap
  --     xnoremap { "(", "<esc>gv<cmd>lua require'surround'.surround_add(false, ')')<cr>l" }
  --     xnoremap { ")", "<esc>gv<cmd>lua require'surround'.surround_add(false, ')')<cr>l" }
  --     xnoremap { "[", "<esc>gv<cmd>lua require'surround'.surround_add(false, ']')<cr>l" }
  --     xnoremap { "]", "<esc>gv<cmd>lua require'surround'.surround_add(false, ']')<cr>l" }
  --     xnoremap { "{", "<esc>gv<cmd>lua require'surround'.surround_add(false, '}')<cr>l" }
  --     xnoremap { "}", "<esc>gv<cmd>lua require'surround'.surround_add(false, '}')<cr>l" }
  --     xnoremap { [["]], [[<esc>gv<cmd>lua require'surround'.surround_add(false, '"')<cr>l]] }
  --     xnoremap { [[']], [[<esc>gv<cmd>lua require'surround'.surround_add(false, "'")<cr>l]] }
  --   end,
  -- }
  -- }}}

  -- File navigation {{{
  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    setup = function()
      vim.keymap.nnoremap { "<leader>n", "<cmd>NvimTreeToggle<cr>" }
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

  use {
    "ThePrimeagen/harpoon",
    config = function()
      local nnoremap = vim.keymap.nnoremap

      nnoremap { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>" }
      nnoremap { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" }
      nnoremap { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>" }
      nnoremap { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>" }
      nnoremap { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" }
      nnoremap { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>" }
      nnoremap { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>" }
      nnoremap { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>" }
    end,
  }
  -- }}}
end)
