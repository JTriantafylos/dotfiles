"
" Plugin declarations
"

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
call plug#end()

"
" Option declarations
"

set clipboard+=unnamedplus " Enable use of system clipboard
set hidden " Enable switching buffers without saving
set cmdheight=2 " Show command output on 2 lines
set updatetime=200 " Increase diagnostic message frequency
set shortmess+=c " Disable ins-completion-menu messages
set signcolumn=yes " enable sign column
set number " Enable line numbers
set tabstop=4 shiftwidth=4 " Set tabs to be 4 spaces wide
set undodir=~/.config/nvim/backups " Set undo directory
set undofile " Enable persistent undo
set scrolloff=5 " Keep 3 lines below and above the cursor
set dictionary=/usr/share/dict/words " Source dictionary words from /usr/share/dict/words

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

" Use <Space> as leader
let mapleader=" "

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Bind leader+g to open FZF Rg
nnoremap <silent> <leader>g :Rg<CR>

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

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
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
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Template declaration for Pandoc notes template
augroup templates
	autocmd BufNewFile *.pandoc 0r Template.pandoc
augroup END

"Always open help files in a rightward vertical split
autocmd FileType help wincmd L

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Hide the statusline when FZF is open
if has('nvim') && !exists('g:fzf_layout')
	autocmd! FileType fzf
	autocmd  FileType fzf set laststatus=0 noshowmode noruler
				\ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" Add preview to :Files
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Add preview to :Rg
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
			\   fzf#vim#with_preview(), <bang>0)
