return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        -- makrdown and markdown_inline treesitter parsers
        'nvim-treesitter/nvim-treesitter',
        -- Icon support
        'echasnovski/mini.icons',
    },
    -- Lazy-load once a markdown file is opened
    ft = { 'markdown', 'codecompanion', },
}
