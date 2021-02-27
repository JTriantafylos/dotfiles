"
" Keybind declarations
"

" Enable mouse use
set mouse=a

" Use <Space> as leader and localleader
let mapleader=" "
let maplocalleader=" "

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Unsets the search highlighting by hitting enter in normal mode
nnoremap <CR> :noh<CR><CR>

" Bind Gd to show the hunk diff of the hovered line
nnoremap <silent> <leader>gd :SignifyHunkDiff<cr>

" Bind leader+f to open FZF Files
nnoremap <silent> <leader>f :Files<CR>

" Bind leader+g+f to open FZF GitFiles
nnoremap <silent> <leader>gf :GFiles<CR>

" Bind leader+g+g to open FZF Rg
nnoremap <silent> <leader>gg :Rg<CR>

" Goto buffer keybind
nnoremap <silent> gb :Buffer<CR>

" Goto companion file (.c/.cpp to .h and vice versa)
nnoremap <silent> gh :FSHere<CR>

" Keep visual block selected when indenting
vmap > >gv
vmap < <gv

" Move cursor by visual lines
nmap <Up> g<Up>
nmap <Down> g<Down>
vmap <Up> g<Up>
vmap <Down> g<Down>

" Remap window movement to use leader and arrow keys
map <leader><Up> :wincmd k<CR>
map <leader><Down> :wincmd j<CR>
map <leader><Left> :wincmd h<CR>
map <leader><Right> :wincmd l<CR>

" Allow use of arrow keys to skip between selected parameters
smap <C-Right> <C-j>
smap <C-Left> <C-k>

" Use tab for trigger completion with characters ahead
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <CR> to confirm completion, <C-g>u means break undo chain at current position.
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workleader symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" Bind escape to close completion menu
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" Save buffer
nnoremap ww :w<CR>

" Close buffer
nnoremap qq :bd<CR>
