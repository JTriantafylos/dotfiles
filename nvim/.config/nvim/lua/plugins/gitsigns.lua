return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = true,
    keys = {
        { '<leader>B', function() require('gitsigns').blame() end, desc = 'Open git-blame', },
    },
}
