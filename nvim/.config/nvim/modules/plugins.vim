let g:peekaboo_window="vert bo 40new" " Make the vim-peekaboo preview window a little bit wider (30 default)

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.65, 'highlight': 'Title', 'border': 'rounded' } } " Configure fzf.vim popup window
let g:fzf_preview_window = ['up:50%'] " Set the fzf.vim preview window to take up the top half of the popup window

let g:coc_fzf_opts = ['--color=16', '--info=inline'] " Set coc-fzf opts to match FZF_DEFAULT_OPTS
