"
" Function declarations
"

" Turn on cursor line for active window (split)
augroup ActiveWindowHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e
