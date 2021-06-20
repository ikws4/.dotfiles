set updatetime=300
set shortmess+=c

" Use <tab> for jump to next placeholder.
let g:coc_snippet_next = '<tab>'

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>f  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Popup menu scrolling
nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-w>j"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-w>k"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"

" Coc list
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
nnoremap <silent><nowait> <space>f  :<C-u>CocList files<CR>
nnoremap <silent><nowait> <space>b  :<C-u>CocList buffers<CR>

" Commands
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

