return {
    'nvim-treesitter/nvim-treesitter',
    -- Update parsers when plugin is installed or updated
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        -- Ensure that all parsers are always installed
        ensure_installed = 'all',
        -- Enable highlighting and indentation modules
        highlight = { enable = true },
        indent = { enable = true },
    },
}
