" Use alt + hjkl to resize windows
nnoremap <Down>    :resize -1<CR>
nnoremap <Up>    :resize +1<CR>
nnoremap <Left>    :vertical resize -1<CR>
nnoremap <Right>    :vertical resize +1<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
