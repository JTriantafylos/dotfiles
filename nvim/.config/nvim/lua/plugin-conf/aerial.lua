local aerial = require('aerial')

-- Keybinds
vim.keymap.set('n', '<leader>o', aerial.toggle)

-- Setup
aerial.setup({
    backends = { 'lsp', 'treesitter' },
    filter_kind = {
        'Class',
        'Constant',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Method',
        'Module',
        'Namespace',
        'Package',
        'Struct',
    },
    show_guides = true,
    lsp = {
        diagnostics_trigger_update = false,
    },
})
