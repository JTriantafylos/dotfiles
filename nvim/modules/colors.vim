"
" Base16-shell compatibility options
"

if filereadable(expand("~/.config/nvim/vimrc_background"))
    let base16colorspace=256
    source ~/.config/nvim/vimrc_background
endif

"
" Highlight configuration
"
highlight Pmenu ctermfg=15 ctermbg=19
highlight StatusLineBufferTitle cterm=bold ctermfg=13  ctermbg=18
