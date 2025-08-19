return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    -- Update parsers when plugin is installed or updated
    build = ':TSUpdate',
    opts = {
        -- Install parsers and queries to the directory where nvim-treesitter is installed
        install_dir = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter',
    },
}
