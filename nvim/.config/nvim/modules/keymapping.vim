" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <Down>    :resize -2<CR>
nnoremap <Up>    :resize +2<CR>
nnoremap <Right>    :vertical resize -2<CR>
nnoremap <Left>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fast way to use vifm
nnoremap <Space> :EditVifm .<CR>

" Use J K to move line up down when your in visual mode
xnoremap K :move '<-2<CR>gv-gv
noremap J :move '>+1<CR>gv-gv

" Turn off search hilight 
nnoremap <leader>h :set invhlsearch<CR>
