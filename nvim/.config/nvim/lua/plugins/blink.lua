return {
    'saghen/blink.cmp',

    dependencies = {
        -- Provides a variety of snippets for different languages
        'rafamadriz/friendly-snippets',
    },

    -- Use latest release tag so the plugin doesn't have to be built from source
    version = '*',

    opts = {
        -- Configure keymaps
        keymap = {
            -- Clear preset keymaps and define my own
            preset = 'none',
            ['<C-space>'] = { 'show',              'fallback', },
            ['<Esc>']     = { 'cancel',            'fallback', },
            ['<Up>']      = { 'select_prev',       'fallback', },
            ['<Down>']    = { 'select_next',       'fallback', },
            ['<S-Tab>']   = { 'select_prev',       'fallback', },
            ['<Tab>']     = { 'select_next',       'fallback', },
            ['<CR>']      = { 'select_and_accept', 'fallback', },
        },
        completion = {
            documentation = {
                -- Always show documentation for each completion item
                auto_show = true,
            },
            menu = {
                draw = {
                    -- Use treesitter to highlight label text
                    treesitter = { 'lsp' },
                    -- Configure displayed columns for each completion item
                    columns = {
                        { 'kind_icon' },
                        { 'label' },
                        { 'source_name' },
                    },
                },
            },
        },
        -- Enable signature help popup
        signature = { enabled = true },
    },
}
