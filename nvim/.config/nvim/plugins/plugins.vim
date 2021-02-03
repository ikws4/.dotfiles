call plug#begin('$HOME/.config/nvim/plugins/plugged')
" Tools
    Plug 'jiangmiao/Auto-pairs'
    Plug 'vifm/vifm.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'sainnhe/sonokai'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()
