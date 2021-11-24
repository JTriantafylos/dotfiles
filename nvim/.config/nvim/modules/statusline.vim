"
" Statusline configuration
"

function! Padding()
    return printf(" ")
endfunction

function! HoveredFunction()
    let mFunction=''
    if strlen(get(b:, 'coc_current_function', '')) > 0
        let mFunction=mFunction . ' '
        let mFunction=mFunction . get(b:, 'coc_current_function', '')
        let mFunction=mFunction . '()'
        let mFunction=mFunction . ' '
    endif
    return mFunction
endfunction

let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'N·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ 'x22' : 'V·Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ 'x19' : 'S·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \ 't'  : 'Terminal'
            \}

function! GetMode()
    return get(g:currentmode, mode(), 'Unknown')
endfunction

set statusline=

set statusline+=%#DiffText#
set statusline+=\ %{GetMode()}
set statusline+=%{Padding()}

set statusline+=%#ModeMsg#
set statusline+=%{Padding()}

set statusline+=%#StatusLineBufferTitle#
set statusline+=\ %f
set statusline+=\ %m

set statusline+=%=

set statusline+=%#TabLineSel#
set statusline+=%{HoveredFunction()}

set statusline+=%#WarningMsg#
set statusline+=%{Padding()}
set statusline+=COC:%{coc#status()}
set statusline+=%{Padding()}

set statusline+=%#TabLineSel#
set statusline+=\ %y
set statusline+=%{Padding()}

set statusline+=%#DiffDelete#
set statusline+=\%r

set statusline+=%#CursorLine#
set statusline+=\%l:%c
set statusline+=%{Padding()}
