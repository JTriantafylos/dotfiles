local telescope = require('telescope')

-- Keybinds
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').builtin)
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>c', require('telescope.builtin').commands)
vim.keymap.set('n', '<leader>d', require('telescope.builtin').diagnostics)
vim.keymap.set('n', 'z=', require('telescope.builtin').spell_suggest)
vim.keymap.set('v', 'z=', require('telescope.builtin').spell_suggest)

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
