-- Enable mouse support in Normal, Visual, and Insert modes
vim.opt.mouse = 'nvi'

-- Use mouse right-click to extend selection
vim.opt.mousemodel = 'extend'

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

-- Enable 'list' mode (to show various whitespace characters)
vim.opt.list = true

-- Characters to use for 'list' mode
vim.opt.listchars = { tab = '⤍  ', trail = '·', extends = '»', precedes = '«', }

-- Disable swap files
vim.opt.swapfile = false

-- Give 2 lines for command-line messages, helps to avoid hit-enter prompts
vim.opt.cmdheight = 2;

-- Always keep 3 lines above or below the cursor
vim.opt.scrolloff = 3;

-- When splitting, create new window to the bottom/right depending on the split direction
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.diagnostic.config({
    virtual_text = {
        source = true, -- Show source of diagnostic
    },
    float = {
        source = true, -- Show source of diagnostic
    },
})
