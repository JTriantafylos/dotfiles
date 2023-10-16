local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- Keybinds
vim.keymap.set('n', '<leader><leader>', builtin.builtin)
vim.keymap.set('n', '<leader>f',        builtin.find_files)
vim.keymap.set('n', '<leader>p',        builtin.git_files)
vim.keymap.set('n', '<leader>g',        builtin.live_grep)
vim.keymap.set('n', '<leader>b',        builtin.buffers)
vim.keymap.set('n', '<leader>c',        builtin.commands)
vim.keymap.set('n', '<leader>d',        builtin.diagnostics)
vim.keymap.set('n', 'z=',               builtin.spell_suggest)
vim.keymap.set('v', 'z=',               builtin.spell_suggest)

-- Setup
telescope.setup {
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = require('telescope.actions').close, -- Remove the need for escape to be pressed twice to close Telescope
                ["<C-y>"] = require('telescope.actions.layout').toggle_preview -- Allow preview toggling
            }
        },

        layout_config = {
            width = 0.95, -- Make the telescope window use more of the available screen width
            height = 0.95, -- Make the telescope window use more of the available screen height
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

-- Load telescope-ui-select.nvim extension
telescope.load_extension("ui-select")

-- Enable line-wrap in preview
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function(args)
        vim.wo.wrap = true
        vim.wo.number = true
    end,
})
