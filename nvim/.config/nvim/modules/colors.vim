"
" Base16-shell compatibility options
"

if filereadable(expand("$XDG_STATE_HOME/base16/vimrc_background"))
    let base16colorspace=256
    source $XDG_STATE_HOME/base16/vimrc_background
endif

"
" Highlight configuration
"
highlight Pmenu ctermfg=15 ctermbg=19
highlight StatusLineBufferTitle cterm=bold ctermfg=13  ctermbg=18
