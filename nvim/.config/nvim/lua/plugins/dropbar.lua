return {
    'Bekaboo/dropbar.nvim',
    lazy = false,
    dependencies = {
        -- Icon support
        { 'echasnovski/mini.icons', config = true, },
    },
    keys = {
        { '<leader>o', function() require('dropbar.api').pick() end, desc = 'Pick symbols in winbar', },
    },
}
