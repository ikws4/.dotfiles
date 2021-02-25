" Vim Configuration
" By ikws4
" January 2021

"""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <ESC>
let mapleader = "'"
set nocompatible

" Fast saving file
nmap <leader>w :w!<cr> 

" Fast yank whole file to system clipboard
nmap <leader>y :%y*<cr>

" Buffer fast switch
nmap fn :bn<cr>
nmap fp :bp<cr>

" Window switch
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h

"""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the wild menu
set wildmenu 

" Show line numbers in the left
set number
set relativenumber 

" Highlight curren line
set cursorline

" File exporer
" https://shapeshed.com/vim-netrw/
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_winsize=24

" Use diffrent cursor in diffrent mode
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes 
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""
" Onedark
" https://github.com/joshdick/onedark.vim
syntax on
packadd! onedark.vim
colorscheme onedark

" Java syntax highlight
let g:java_highlight_all=1


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs 
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4 

" Auto, smart indent and wrap lines
set ai
set si
set wrap
set cindent

"""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell chekcing
"""""""""""""""""""""""""""""""""""""""""""""""""
" Perssing 'ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""
" => SnipMate
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:snipMate={ 'snippet_version' : 1 }
