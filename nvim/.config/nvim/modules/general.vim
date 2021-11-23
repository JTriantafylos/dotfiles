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
set signcolumn=number " Display signs in the number column
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
