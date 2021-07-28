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
    "hoob3rt/lualine.nvim",
    config = function()
      require "config.lualine"
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
  use {
    "glepnir/dashboard-nvim",
    config = function()
      require "config.dashboard"
    end,
  }
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
      require("surround").setup {}
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
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify "Downloading packer..."
  vim.nnotify(fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(plugins)
