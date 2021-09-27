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
    event = "BufRead",
    config = function()
      require("modes").setup()
    end,
  }

  -- Distraction-free coding for Neovim
  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = "<leader>z",
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
    event = "ColorScheme",
    config = function()
      local icons = require "codicons"
      local notify = require "notify"

      notify.setup {
        stages = "slide",
        background_colour = "Normal",
        timeout = 2500,
        icons = {
          ERROR = icons.get("error", "icon"),
          WARN = icons.get("warning", "icon"),
          INFO = icons.get("info", "icon"),
          DEBUG = icons.get("debug", "icon"),
          TRACE = icons.get("dashboard", "icon"),
        },
      }

      vim.notify = notify
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

  -- Interact with Jupyter from NeoVim.
  use {
    "dccsillag/magma-nvim",
    ft = "python",
    run = "<Cmd>UpdateRemotePlugins",
    config = function()
      require("which-key").register {
        ["<localleader>e"] = {
          "nvim_exec('MagmaEvaluateOperator', v:true)",
          "Evaluate line",
          buffer = 0,
          expr = true,
        },
        ["<localleader>ee"] = { "<Cmd>MagmaEvaluateLine<CR>", "Evaluate line", buffer = 0 },
        ["<localleader>ed"] = { "<Cmd>MagmaDelete<CR>", "Delete evaluate output", buffer = 0 },
        ["<localleader>ec"] = { "<Cmd>MagmaReevaluateCell<CR>", "Reevaluate cell", buffer = 0 },
        ["<localleader>eo"] = { "<Cmd>MagmaShowOutput<CR>", "Show output", buffer = 0 },
      }

      vim.api.nvim_buf_set_keymap(
        0,
        "x",
        "<localleader>e",
        ":<C-u>MagmaEvaluateVisual<CR>",
        { noremap = true, silent = true }
      )

      vim.g.magma_automatically_open_output = false
    end,
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        signs = false,
        highlight = {
          keyword = "fg",
        },
        colors = {
          error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
          warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
          info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
          hint = { "LspDiagnosticsDefaultHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
        },
      }
      require("which-key").register {
        ["<leader>st"] = { "<Cmd>TodoTelescope<CR>", "Search todos" },
      }
    end,
  }

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
        auto_select = false, -- automatically select the first item
      }
    end,
  }

  -- A completion plugin for neovim coded in Lua.
  use {
    "hrsh7th/nvim-cmp",
    branch = "custom-menu",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
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

      wk.register {
        ["<leader>"] = {
          f = { name = "+file" },
          b = { name = "+buffer" },
          g = { name = "+git" },
          s = { name = "+search" },
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
          q = {
            name = "+Quickfix",
            o = { "<Cmd>copen<CR>", "Open quickfix" },
            c = { "<Cmd>cclose<CR>", "Close quickfix" },
            n = { "<Cmd>cnext<CR>", "Cycle next quickfix" },
            p = { "<Cmd>cprev<CR>", "Cycle prev quickfix" },
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
        F = { "<Cmd>HopChar1BC<CR>", "Hop 1 char before" },
        f = { "<Cmd>HopChar1AC<CR>", "Hop 1 char after" },
        s = { "<Cmd>HopChar2<CR>", "Hop 2 char" },
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
  use {
    "nvim-lua/lsp-status.nvim",
    config = function()
      require("lsp-status").register_progress()
    end,
  }
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
    event = { "CursorHold", "CursorHoldI" },
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
    requires = { "nvim-lua/plenary.nvim" },
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
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 500,
        },
      }

      require("which-key").register {
        ["<leader>g"] = {
          ["["] = { "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", "Jump to previous hunk", expr = true },
          ["]"] = { "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", "Jump to next hunk", expr = true },
          s = { "<Cmd>Gitsigns stage_hunk<CR>", "Git stage hunk" },
          u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Git unstage hunk" },
          r = { "<Cmd>Gitsigns reset_stage_hunk<CR>", "Revert hunk" },
          R = { "<Cmd>Gitsigns reset_buffer<CR>", "Revert file" },
        },
      }
    end,
  }

  -- magit for neovim
  use {
    "TimUntersberger/neogit",
    keys = { "<leader>gg", "<leader>gb" },
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
      require("which-key").register {
        ["<leader>g"] = {
          g = { "<Cmd>lua require('neogit').open({kind = 'split_above'})<CR>", "Neogit status" },
          b = { "<Cmd>lua require('neogit').open({'branch'})<CR>", "Neogit branch" },
        },
      }
    end,
  }
  --}}}

  -- Note taking {{{
  -- Modernity meets insane extensibility. The future of organizing your life in Neovim.
  use {
    "nvim-neorg/neorg",
    branch = "unstable",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("neorg").setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                default = "~/Dev/GitHub/notes",
              },
            },
          },
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
            },
          },
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
    autocmd BufWritePost */ikws4/*.lua source <afile> | PackerCompile
    autocmd User PackerCompileDone lua vim.notify("Plugins compiled", "info", { title = "Packer" })
  augroup END
]]
