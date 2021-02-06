" set leader key
let g:mapleader = "'"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=UTF-8                      " The encoding displayed
set fileencoding=UFT-8
set cmdheight=2                         " Give more space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number relativenumber               " Line numbers
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set spelllang=en_us                     " Spell check
set hls is                              " Making sure search hilights words as we type them
set ic                                  " Ignore case in search pattern
set cursorline

au BufWritePost $MYVIMRC source $MYVIMRC
