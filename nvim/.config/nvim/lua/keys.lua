-- TODO: Switch keybinds over to vim.keymap api when it becomes availale
local default_opts = { noremap = true, silent = true }

-- Use space as the leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Shortcut to write file to disk
vim.api.nvim_set_keymap('n', 'ww', ':write<CR>', default_opts)

-- Allow indent/de-indent multiple times in a row
vim.api.nvim_set_keymap('v', '<', '<gv', default_opts)
vim.api.nvim_set_keymap('v', '>', '>gv', default_opts)

-- Paste over currently selected text without yanking it
vim.api.nvim_set_keymap('v', 'p', '"_dP', default_opts)

-- Cancel search highlighting
vim.api.nvim_set_keymap('n', '<ESC>', ':nohlsearch<CR>', default_opts)

-- Switch to most recent buffer
vim.api.nvim_set_keymap('n', 'gb', '<C-^>', default_opts)
