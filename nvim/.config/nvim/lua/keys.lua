-- Use space as the leader key
vim.keymap.set('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Shortcut to write file to disk
vim.keymap.set('n', 'ww', ':write<CR>',  { silent = true })

-- Allow indent/de-indent multiple times in a row
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Paste over currently selected text without yanking it
vim.keymap.set('v', 'p', '"_dP')

-- Cancel search highlighting
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>',  { silent = true })

-- Shortcuts to previous and next buffers
vim.keymap.set('n', '[b', ':bprev<CR>',  { silent = true })
vim.keymap.set('n', ']b', ':bnext<CR>',  { silent = true })
