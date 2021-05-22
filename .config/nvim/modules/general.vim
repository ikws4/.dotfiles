" set leader key
let g:mapleader = "'"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set cmdheight=2                         " Give more space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set spelllang=en_us                     " Spell check
set hls is                              " Making sure search hilights words as we type them
set ic                                  " Ignore case in search pattern
set cursorline                          
set termguicolors

" Number line
set number 
set relativenumber

" Indenting
set tabstop=4
set shiftwidth=4
set expandtab
" set autoindent
" set smartindent
" set smarttab
" set cindent

" Encoding
set encoding=UTF-8
set fileencoding=UTF-8
