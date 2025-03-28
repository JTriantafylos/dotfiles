return {
    'nvim-treesitter/nvim-treesitter',
    -- Update parsers when plugin is installed or updated
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        -- Automatically install missing parsers when entering a buffer
        auto_install = true,
        -- Enable highlighting and indentation modules
        highlight = { enable = true },
        indent = { enable = true },
    },
}
