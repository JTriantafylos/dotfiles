"
" Plugin declarations
"

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mboughaba/i3config.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'delphinus/vim-firestore'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

"
" Source modules
"
source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/functions.vim
source $HOME/.config/nvim/modules/colors.vim
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/keybinds.vim
source $HOME/.config/nvim/modules/statusline.vim
