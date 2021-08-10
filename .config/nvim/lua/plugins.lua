local function plugins(use)
  -- Packer can manage itself as an optional plugin
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/popup.nvim"

  use {
    "sainnhe/sonokai",
    config = function()
      require "config.theme"
    end,
  }
  use {
    "glepnir/galaxyline.nvim",
    config = function()
      require "config.statusline"
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "config.treesitter"
    end,
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
    },
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "config.telescope"
    end,
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "config.tree"
    end,
  }
  -- use {
  --   "glepnir/dashboard-nvim",
  --   config = function()
  --     require "config.dashboard"
  --   end,
  -- }
  use {
    "numtostr/FTerm.nvim",
    config = function()
      require "config.terminal"
    end,
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }

  -- Utils
  use {
    "b3nj5m1n/kommentary",
    config = function()
      require "config.kommentary"
    end,
  }
  use {
    "mhartington/formatter.nvim",
    config = function()
      require "config.formatter"
    end,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
  use {
    "phaazon/hop.nvim",
    config = function()
      require "config.hop"
    end,
  }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require("surround").setup {
        mappings_style = "surround",
      }
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      require("nvim-autopairs.completion.compe").setup {
        map_cr = true,
        map_complete = true,
      }
    end,
  }
  use {
    "hrsh7th/vim-vsnip",
    requires = {
      "hrsh7th/vim-vsnip-integ",
      "rafamadriz/friendly-snippets",
    },
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lspconfig"
    end,
    requires = {
      "kabouzeid/nvim-lspinstall",
      "folke/lua-dev.nvim",
    },
  }
  use {
    "nvim-lua/lsp-status.nvim",
    config = function()
      require("lsp-status").register_progress()
    end,
  }
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga {
        use_saga_diagnostic_sign = false,
        code_action_prompt = {
          enable = false,
        },
        rename_prompt_prefix = ">",
        code_action_keys = {
          quit = "<esc>",
          exec = "<CR>",
        },
        rename_action_keys = {
          quit = "<esc>",
          exec = "<CR>",
        },
      }
    end,
  }
  use {
    "hrsh7th/nvim-compe",
    config = function()
      require "config.compe"
    end,
  }
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      vim.g.symbols_outline = {
        highlight_hovered_item = false,
        show_guides = true,
        auto_preview = false,
        show_symbol_details = true,
      }
    end,
  }
  use {
    "akinsho/flutter-tools.nvim",
    config = function()
      require("flutter-tools").setup()
    end,
  }
end

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath "config" .. "/packer/packer_compiled.lua"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify "Downloading packer..."
  vim.notify(fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup {
  plugins,
  config = {
    compile_path = compile_path,
  },
}

if not vim.g.compile_path_loaded and not vim.g.vscode then
  vim.cmd("source " .. compile_path)
  vim.g.compile_path_loaded = true
end
