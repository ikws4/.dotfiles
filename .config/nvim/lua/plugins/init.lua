-- Bootstrap Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.notify('Downloading Packer.nvim...')
  vim.notify(vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path}))
end

--- Require a plugin config
--- @param name string
--- @return any
local function conf(name)
  return require('plugins.' .. name)
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    'sainnhe/sonokai',
    config = conf('sonokai')
  }
  use 'itchyny/lightline.vim'

  -- Tool
  use {
    'nvim-treesitter/nvim-treesitter',
    config = conf('treesitter'),
    requires = {
     'nvim-treesitter/nvim-treesitter-textobjects'
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = conf('telescope'),
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = conf('tree'),
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- Utils
  use 'b3nj5m1n/kommentary'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'christoomey/vim-system-copy'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  use {
    'phaazon/hop.nvim',
    config = conf('hop')
  }
  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require('surround').setup({})
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = conf('lspconfig'),
    requires = {
      'kabouzeid/nvim-lspinstall',
      'hrsh7th/nvim-compe',
      'L3MON4D3/LuaSnip',
      'folke/lua-dev.nvim'
    }
  }
end)
