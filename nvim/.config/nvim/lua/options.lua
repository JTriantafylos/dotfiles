-- Enable mouse support in Normal mode and Visual mode
vim.opt.mouse = 'nv'

-- Enable line numbers
vim.opt.number = true

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

-- Show tabs, trailing spaces, and non-breakable space characters
vim.opt.list = true
vim.opt.listchars = 'trail:\\u00B7,tab: \\u00B7 '

-- Enable persistent undo
vim.opt.undofile = true
