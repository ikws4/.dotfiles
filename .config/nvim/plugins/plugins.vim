call plug#begin('$HOME/.config/nvim/plugins/plugged')
" Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sainnhe/sonokai'
    
" Tools
    Plug 'vifm/vifm.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mhinz/vim-startify'
    Plug 'plasticboy/vim-markdown'
    Plug 'tfnico/vim-gradle'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

" Icon
    Plug 'ryanoasis/vim-devicons'
call plug#end()
