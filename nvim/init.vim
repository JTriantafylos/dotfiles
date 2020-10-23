"
" Plugin declarations
"

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mboughaba/i3config.vim'
call plug#end()

"
" Option declarations
"

set clipboard+=unnamedplus " Enable use of system clipboard
set cul " Enabled the cursor line highlight
set hidden " Enable switching buffers without saving
set cmdheight=2 " Show command output on 2 lines
set updatetime=100 " Increase diagnostic message frequency
set shortmess+=c " Disable ins-completion-menu messages
set nobackup " Some LSP have issues with backups
set nowritebackup " Some LSP have issues with backups

if has("patch-8.1.1564") " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set number " Enable line numbers
set undodir=~/.config/nvim/backups " Set undo directory
set undofile " Enable persistent undo
set scrolloff=5 " Keep 5 lines below and above the cursor
set dictionary=/usr/share/dict/words " Source dictionary words from /usr/share/dict/words
set noshowmode " Disable writing what mode vim is in to the status line
set ignorecase " Ignore case in searches
set smartcase " Don't ignore case if case is used
set tabstop=4 " Correct tab size to 4 spaces
set shiftwidth=4  " Correct tab size to 4 space
set expandtab " Use spaces instead of tabs
filetype plugin indent on " Enable filetype dependent indenting
syntax on " Enables syntax highlighting

let g:peekaboo_window="vert bo 50new" " Make the vim-peekaboo preview window a little bit wider (30 default)

"
" Base16-shell compatibility options
"

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

"
" Keybind declarations
"

" Enable mouse use
set mouse=a

" Use <Space> as leader
let mapleader=" "

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Unsets the search highlighting by hitting enter in normal mode
nnoremap <CR> :noh<CR><CR>

" Bind Gd to show the hunk diff of the hovered line
nnoremap <silent> <leader>gd :SignifyHunkDiff<cr>

" Bind Gf to open FZF GitFiles
nnoremap <silent> <leader>gf :GFiles<CR>

" Bind leader+g to open FZF Rg
nnoremap <silent> <leader>gg :Rg<CR>

" Bind gf to open FZF Files
nnoremap <silent> gf :Files<CR>

" Goto buffer keybind
nnoremap <silent> gb :Buffer<CR>

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

" Save and close buffer
nnoremap xx :x<CR>

"
" Function declarations
"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Turn on cursor line for active window (split)
augroup ActiveWindowHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Always open help files in a rightward vertical split
autocmd FileType help wincmd L

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Add preview to :Files
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Add preview to :Rg
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)

"
" Highlight configuration
"
highlight Pmenu ctermfg=15 ctermbg=19
highlight StatusLineBufferTitle cterm=bold ctermfg=13  ctermbg=18

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

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '   '.l:branchname.' ' : ''
endfunction

set statusline=

set statusline+=%#DiffText#
set statusline+=\ %{GetMode()}
set statusline+=%{Padding()}

set statusline+=%#ModeMsg#
set statusline+=%{StatuslineGit()}

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
