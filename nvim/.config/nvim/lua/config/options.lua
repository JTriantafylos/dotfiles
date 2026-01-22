-- ================================
-- Global Variables
-- ================================

-- Disable providers for remote plugins
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- ================================
-- General Settings
-- ================================

-- Enable persistent undo
vim.opt.undofile = true
-- Disable swap files
vim.opt.swapfile = false

-- ================================
-- Cursor Settings
-- ================================

-- Highlight the current line
vim.opt.cursorline = true
-- Keep 2 lines above and below the cursor when scrolling
vim.opt.scrolloff = 2

-- ================================
-- Window Splitting Settings
-- ================================

-- Split new windows below the current one
vim.opt.splitbelow = true
-- Split new windows to the right of the current one
vim.opt.splitright = true

-- ================================
-- Mouse Settings
-- ================================

-- Allow right-click to extend selection in visual mode
vim.opt.mousemodel = 'extend'

-- ================================
-- Display Settings
-- ================================

-- Set command line height
vim.opt.cmdheight = 2
-- Show absolute line numbers
vim.opt.number = true
-- Show relative line numbers
vim.opt.relativenumber = true
-- Enable 'list' mode to visualize whitespace
vim.opt.list = true
-- Define characters for whitespace in 'list' mode
vim.opt.listchars = { tab = '-->', trail = '·', extends = '»', precedes = '«' }
-- Configure display options
vim.opt.display = { 'lastline', 'uhex' }

-- ================================
-- Indentation Settings
-- ================================

-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Set number of spaces for each indentation level
vim.opt.shiftwidth = 4
-- Set number of spaces a tab character represents
vim.opt.tabstop = 4
-- Enable correct indentation for wrapped lines
vim.opt.breakindent = true

-- ================================
-- Search Settings
-- ================================

-- Ignore case in search patterns
vim.opt.ignorecase = true
-- Enable smart case searching
vim.opt.smartcase = true
-- Enable the nohlsearch package
vim.cmd('packadd nohlsearch')

-- ================================
-- Clipboard Settings
-- ================================

-- Use the system clipboard for all operations
vim.opt.clipboard = 'unnamedplus'

-- ================================
-- Spellcheck Settings
-- ================================

-- Enable spellcheck in text, markdown, and git commit files
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'text' , 'markdown', 'gitcommit', },
    callback = function()
        vim.opt_local.spell = true
    end
})
