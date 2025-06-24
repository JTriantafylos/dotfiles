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
            -- Show the completion menu and select the first item
            ['<C-space>'] = { 'show_and_insert', 'fallback', },
            -- Cancel any previewed completions and hide the completion menu
            ['<Esc>']     = { 'cancel',          'fallback', },
            -- Select the previous item in the completion list
            ['<Up>']      = { 'select_prev',     'fallback', },
            -- Select the next item in the completion list
            ['<Down>']    = { 'select_next',     'fallback', },
            -- Select the previous item in the completion list
            ['<S-Tab>']   = { 'select_prev',     'fallback', },
            -- Select the next item in the completion list
            ['<Tab>']     = { 'select_next',     'fallback', },
            -- Accepts the currently selected completion item, if any
            ['<CR>']      = { 'accept',          'fallback', },
        },
        completion = {
            documentation = {
                -- Always show documentation for each completion item
                auto_show = true,
            },
            list = {
                selection = {
                    -- Don't auto-select the first completion item
                    preselect = false,
                    -- Automatically insert the selected completion item
                    auto_insert = true,
                },
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
