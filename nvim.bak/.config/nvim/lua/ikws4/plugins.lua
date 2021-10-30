---@diagnostic disable: different-requires
local function plugins(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- UI {{{
  -- Currently used theme for my entire terminal
  use {
    "rose-pine/neovim",
    as = "rose-pine",
  }

  use {
    "glepnir/dashboard-nvim",
    config = function()
      require "ikws4.config.dashboard"
    end,
  }

  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  use {
    "hoob3rt/lualine.nvim",
    event = "ColorScheme",
    config = function()
      require "ikws4.config.lualine"
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

  -- No-nonsense floating terminal plugin for neovim
  use {
    "numtostr/FTerm.nvim",
    after = "which-key.nvim",
    keys = "<leader>m",
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
    module = "telescope",
    cmd = "Telescope",
    requires = { { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
    setup = function()
      require("ikws4.config.telescope").setup()
    end,
    config = function()
      require("ikws4.config.telescope").config()
    end,
  }

  -- A fancy, configurable, notification manager for NeoVim
  use {
    "rcarriga/nvim-notify",
    event = "ColorScheme",
    config = function()
      local notify = require "notify"

      notify.setup {
        stages = "slide",
        background_colour = "Normal",
        timeout = 2500,
      }

      vim.notify = notify
    end,
  }

  --}}}

  -- Window {{{
  use {
    "beauwilliams/focus.nvim",
    event = "ColorScheme",
    config = function()
      require("focus").setup {
        cursorline = false,
        signcolumn = false,
        winhighlight = true,
        bufnew = true,
      }

      require("which-key").register {
        ["<leader>wn"] = { "<Cmd>FocusSplitNicely<CR><Cmd>Telescope find_files hidden=true<CR>", "Split nicely" },
        ["<leader>wf"] = { "<Cmd>FocusMaximise<CR>", "Fullscreen" },
        ["<leader>w="] = { "<Cmd>FocusEqualise<CR>", "Equally high and wide" },
      }

      vim.wo.winhighlight = "Normal:FocusedWindow,NormalNC:UnfocusedWindow,SignColumn:NvimTreeNormal"
    end,
  }

  -- Rearrange your windows with ease.
  use {
    "sindrets/winshift.nvim",
    cmd = "WinShift",
    keys = "<leader>wm",
    config = function()
      require("winshift").setup {
        focused_hl_group = "Normal",
      }
      require("which-key").register {
        ["<leader>wm"] = { "<Cmd>WinShift<CR>", "Move windows" },
      }
    end,
  }
  -- }}}

  -- Util {{{
  -- Icons
  use "mortepau/codicons.nvim"
  use "kyazdani42/nvim-web-devicons"

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
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }

  -- A completion plugin for neovim coded in Lua.
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "ikws4.config.nvim_cmp"
    end,
  }

  -- A super powerful autopairs for Neovim. It support multiple character.
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end,
  }

  -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
  use {
    "hrsh7th/vim-vsnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      vim.g.vsnip_snippet_dirs = {
        vim.fn.stdpath "data" .. "/site/pack/packer/start/friendly-snippets/snippets",
        vim.fn.stdpath "config" .. "/snippets",
      }
    end,
  }

  use {
    "hrsh7th/cmp-vsnip",
    after = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-vsnip",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-buffer",
  }

  use {
    "hrsh7th/cmp-path",
    after = "cmp-nvim-lsp",
  }

  use {
    "f3fora/cmp-spell",
    after = "cmp-path",
  }

  -- The fastest Neovim colorizer.
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup({ "*" }, { names = false })
    end,
  }

  --  Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5
  --  that displays a popup with possible keybindings of the command you
  --  started typing.
  use {
    "folke/which-key.nvim",
    config = function()
      require "ikws4.config.which-key"
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "ikws4.config.nvim_treesitter"
    end,
    run = "<Cmd>TSUpdate",
    requires = { "nvim-treesitter/nvim-treesitter-textobjects", "nvim-treesitter/nvim-treesitter-refactor" },
  }

  -- This will break the ftdetect
  -- https://github.com/nathom/filetype.nvim/issues/9
  use {
    "nathom/filetype.nvim",
    disable = true,
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
  --}}}

  -- Motion {{{
  use {
    "ggandor/lightspeed.nvim",
  }
  --}}}

  -- Lsp {{{
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "onsails/lspkind-nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }

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
  -- magit for neovim
  use {
    "TimUntersberger/neogit",
    keys = { "<leader>gg" },
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
          g = { "<Cmd>lua require('neogit').open()<CR>", "Neogit status" },
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
          ["core.integrations.treesitter"] = {
            config = {
              highlights = {
                Tag = {
                  Name = {
                    [""] = "+TSKeyword",
                  },
                  Content = "guibg=NONE",
                },
                CarryoverTag = {
                  Name = {
                    [""] = "+TSLabel",
                  },
                },
                Marker = {
                  Title = "+TSLabel",
                },
              },
              dim = {
                CodeBlock = {
                  reference = "UnfocusedWindow",
                  percentage = 0,
                },
              },
            },
          },
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
        return require("packer.util").float {
          border = "solid",
        }
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
    autocmd BufWritePost */nvim/lua/ikws4/*.lua source <afile> | PackerCompile
  augroup END
]]
