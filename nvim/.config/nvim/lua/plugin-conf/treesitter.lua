-- Setup
require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',

    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['as'] = '@block.outer',
            },
        },
    },
}
