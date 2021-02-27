colorscheme nord

let g:nord_uniform_status_lines=1 
let g:nord_cursor_line_number_background=0
let g:nord_bold_vertical_split_line=1
let g:nord_uniform_diff_background=1
set fillchars=vert:\ ,eob:\ 

" Treesitter hilighting
hi tstype guifg=#8fbcbb ctermfg=14
hi tsannotation guifg=#d08770 ctermfg=11
hi TSOperator guifg=#81A1C1 ctermfg=4
hi! link TSConstBuiltin TSOperator
