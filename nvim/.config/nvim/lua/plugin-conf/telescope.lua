local telescope = require('telescope')

-- Keybinds
local default_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader><leader>', ':lua require(\'telescope.builtin\').builtin() <CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>f', ':lua require(\'telescope.builtin\').find_files() <CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>g', ':lua require(\'telescope.builtin\').live_grep() <CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>b', ':lua require(\'telescope.builtin\').buffers() <CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require(\'telescope.builtin\').commands() <CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>d', ':lua require(\'telescope.builtin\').diagnostics() <CR>', default_opts)
vim.api.nvim_set_keymap('n', 'z=', ':lua require(\'telescope.builtin\').spell_suggest() <CR>', default_opts)
vim.api.nvim_set_keymap('v', 'z=', ':lua require(\'telescope.builtin\').spell_suggest() <CR>', default_opts)

-- Setup
telescope.setup {
    defaults = {
        mappings = {
            -- Remove the need for escape to be pressed twice to close Telescope
            i = { ['<esc>'] = require('telescope.actions').close },
        },

        -- Remove indentation from pickers using ripgrep
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim'
        },
    },

    pickers = {
        find_files = {
            -- Strip ./ from beginning of each line in find_files picker
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' }
        }
    }
}

-- Load telescope-fzf-native.nvim extension
telescope.load_extension('fzf')
