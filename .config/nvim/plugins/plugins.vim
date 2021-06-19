call plug#begin('$HOME/.config/nvim/plugins/plugged')

  " Appearance
  Plug 'arcticicestudio/nord-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'
  Plug 'ryanoasis/vim-devicons'
    
  " Tools
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'plasticboy/vim-markdown'

  " File explore
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

  " Motions and operators improvement
  Plug 'b3nj5m1n/kommentary'
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-system-copy'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

call plug#end()
