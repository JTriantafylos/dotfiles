-- Enable mouse support in Normal, Visual, and Insert modes
vim.opt.mouse = 'nvi'

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Open all folds when a file is opened
vim.opt.foldlevelstart = 99

-- Enable nvim-treesitter fold support
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Use system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Set tab behavior
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Enable persistent undo
vim.opt.undofile = true

-- Enable case insensitive searching, except when capitals are explictly searched for
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indent wrapped lines correctly
vim.opt.breakindent = true

-- Highlight cursor line
vim.opt.cursorline = true

-- Disable swap files
vim.opt.swapfile = false

-- Give 2 lines for command-line messages, helps to avoid hit-enter prompts
vim.opt.cmdheight = 2;

-- Enable spellcheck for Markdown files
vim.api.nvim_create_autocmd('filetype', { pattern = { 'markdown', 'text' }, command = 'setlocal spell' })
