local function plugins(use)
  use "wbthomason/packer.nvim"

  -- UI {{{
  -- Currently used theme for my entire terminal
  use {
    "rose-pine/neovim",
    as = "rose-pine",
  }

  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "ikws4.config.lualine"
    end,
  }

  -- Highlight UI elements based on current mode.
  use {
    "mvllow/modes.nvim",
    config = function()
      require("modes").setup()
    end,
  }

  -- Distraction-free coding for Neovim
  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "ikws4.config.zen_mode"
    end,
  }

  use { "mhinz/vim-startify" }

  -- No-nonsense floating terminal plugin for neovim
  use {
    "numtostr/FTerm.nvim",
    after = "which-key.nvim",
    keys = "<leader>m",
    config = function()
      require("FTerm").setup()
      require("which-key").register {
        ["<leader>m"] = { "<Cmd>lua require('FTerm').open()<CR>", "Open floating terminal" },
        ["<Esc>"] = { "<cmd>lua require('FTerm').close()<CR>", "Open floating terminal", mode = "t" },
      }
    end,
  }

  -- A file explorer tree for neovim written in lua
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    keys = "<leader>n",
    config = function()
      require "ikws4.config.nvim_tree"
    end,
  }

  -- Find, Filter, Preview, Pick. All lua, all the time.
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      require "ikws4.config.telescope"
    end,
  }

  -- A fancy, configurable, notification manager for NeoVim
  use {
    "rcarriga/nvim-notify",
    config = function()
      -- vim.notify = require "notify"
    end,
  }

  -- An Nvim lua plugin that dims your inactive windows
  use {
    "sunjon/Shade.nvim",
    config = function()
      require("shade").setup { overlay_opacity = 35 }
    end,
  }
  --}}}

  -- Util {{{
  -- Icons
  use "mortepau/codicons.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- Neovim commenting plugin, written in lua.
  use {
    "b3nj5m1n/kommentary",
    config = function()
      local kommentary = require "kommentary.config"

      kommentary.configure_language("default", {
        prefer_single_line_comments = true,
      })

      kommentary.configure_language("dart", {
        single_line_comment_string = "//",
        prefer_single_line_comments = true,
      })
    end,
  }

  -- A super powerful autopairs for Neovim. It support multiple character.
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      require("nvim-autopairs.completion.cmp").setup {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` after select function or method item
        auto_select = true, -- automatically select the first item
      }
    end,
  }

  -- A completion plugin for neovim coded in Lua.
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
    },
    config = function()
      require "ikws4.config.nvim_cmp"
    end,
  }

  -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
  use {
    "hrsh7th/vim-vsnip",
    requires = { "rafamadriz/friendly-snippets" },
  }

  -- The fastest Neovim colorizer.
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
      }, {
        names = false,
      })
    end,
  }

  --  Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5
  --  that displays a popup with possible keybindings of the command you
  --  started typing.
  use {
    "folke/which-key.nvim",
    config = function()
      local wk = require "which-key"

      wk.register {
        ["<leader>"] = {
          f = {
            name = "+file",
            f = { "<cmd>Telescope find_files hidden=true<CR>", "Find File" },
            r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
          },
          b = {
            name = "+buffer",
            b = { "<cmd>Telescope buffers<CR>", "Switch buffer" },
          },
          g = {
            name = "+git",
          },
          s = {
            name = "+search",
            h = { "<cmd>Telescope help_tags<CR>", "Search help" },
            b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search buffer" },
            B = {
              "<cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true })<CR>",
              "Search all open buffers",
            },
            p = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Search project" },
          },
          w = {
            name = "+window",
            s = "Split window",
            v = "Split window vertically",
            w = "Switch windows",
            q = "Quit a window",
            T = "Break out into a new tab",
            x = "Swap current with next",
            ["-"] = "Decrease height",
            ["+"] = "Increase height",
            ["<lt>"] = "Decrease width",
            [">"] = "Increase width",
            ["|"] = "Max out the width",
            ["="] = "Equally high and wide",
            h = "Go to the left window",
            l = "Go to the right window",
            k = "Go to the up window",
            j = "Go to the down window",
          },
          z = { "<cmd>ZenMode<CR>", "Toggle zen mode" },
          -- n = { "<cmd>Telescope file_browser<CR>", "Open file browser"}
        },
      }

      wk.setup {
        plugins = {
          marks = true,
          registers = true,
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = false,
            nav = true,
            z = true,
            g = true,
          },
        },
      }
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "ikws4.config.nvim_treesitter"
    end,
    run = "<Cmd>TSUpdate",
    requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
  }

  --}}}

  -- Motion {{{

  -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a
  -- document with as few keystrokes as possible.
  use {
    "phaazon/hop.nvim",
    after = "which-key.nvim",
    config = function()
      require("hop").setup()
      require("which-key").register {
        F = { "<Cmd>HopChar2BC<CR>", "Hop 2 char before" },
        f = { "<Cmd>HopChar2AC<CR>", "Hop 2 char after" },
      }
    end,
  }

  -- A surround text object plugin for neovim written in lua.
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  }
  --}}}

  -- Lsp {{{
  use { "neovim/nvim-lspconfig" }
  use { "kabouzeid/nvim-lspinstall" }
  use { "nvim-lua/lsp-status.nvim" }
  use { "ray-x/lsp_signature.nvim" }
  use { "onsails/lspkind-nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }

  -- Tools to help create flutter apps in neovim using the native lsp
  use {
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  use {
    "folke/lua-dev.nvim",
  }

  -- VSCode 💡 for neovim's built-in LSP.
  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      _G.lightbulb = function()
        require("nvim-lightbulb").update_lightbulb {
          sign = {
            enabled = false,
          },
          float = {
            enabled = true,
            text = require("codicons").get("lightbulb", "icon"),
            win_opts = {
              offset_x = -4,
              offset_y = -2,
              border = "none",
              winblend = 0,
            },
          },
        }
      end

      vim.cmd [[hi LightBulbFloatWin guifg=#FFCC01]]
      vim.cmd [[
        augroup LightbulbAutoGroup
          autocmd!
          autocmd CursorHold,CursorHoldI * call v:lua.lightbulb()
        augroup END
      ]]
    end,
  }
  --}}}

  -- Git {{{
  -- Super fast git decorations implemented purely in lua/teal.
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { hl = "GitSignsAdd", text = "┃" },
          change = { hl = "GitSignsChange", text = "┃" },
          delete = { hl = "GitSignsDelete", text = "┃" },
          topdelete = { hl = "GitSignsDelete", text = "┃" },
          changedelete = { hl = "GitSignsChangeDelete", text = "┃" },
        },
        keymaps = {
          noremap = true,
          ["v <leader>gs"] = '<Cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ["v <leader>gr"] = '<Cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',

          -- Text objects
          ["o ih"] = '<Cmd><C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ["x ih"] = '<Cmd><C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        },

        require("which-key").register {
          ["<leader>g"] = {
            ["["] = { "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", "Jump to previous hunk", expr = true },
            ["]"] = { "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", "Jump to next hunk", expr = true },
            s = { "<Cmd>Gitsigns stage_hunk<CR>", "Git stage hunk" },
            u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Git unstage hunk" },
            r = { "<Cmd>Gitsigns reset_stage_hunk<CR>", "Revert hunk" },
            R = { "<Cmd>Gitsigns reset_buffer<CR>", "Revert file" },
          },
        },
      }
    end,
  }

  -- magit for neovim
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    keys = { "<leader>gg", "<leader>gb" },
    config = function()
      require("neogit").setup {
        disable_commit_confirmation = true,
        signs = {
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
      }
      require("which-key").register {
        ["<leader>g"] = {
          g = { "<Cmd>Neogit kind=split_above<CR>", "Neogit status" },
          b = { "<Cmd>Neogit branch<CR>", "Neogit branch" },
        },
      }
    end,
  }
  --}}}
end

-- Bootstrapping {{{
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath "config" .. "/packer/packer_compiled.lua"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify "Downloading packer..."
  vim.notify(fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end
--}}}

-- Startup {{{
require("packer").startup {
  plugins,
  config = {
    compile_path = compile_path,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  },
}

if not vim.g.compile_path_loaded and not vim.g.vscode then
  vim.cmd("source " .. compile_path)
  vim.g.compile_path_loaded = true
end
--}}}

vim.cmd [[
  augroup PackerCompileAutoGroup
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup END
]]