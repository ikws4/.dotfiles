vim.cmd [[
  augroup ProcessingInit
    autocmd!
    autocmd BufRead,BufNewFile *.pde set filetype=processing
    autocmd BufRead,BufNewFile *.pde compiler processing 
    autocmd BufRead,BufNewFile *.pde silent execute "!yabai -m rule --add app='" expand("%:p:h:t") .. "' manage=off"
  augroup END
]]
