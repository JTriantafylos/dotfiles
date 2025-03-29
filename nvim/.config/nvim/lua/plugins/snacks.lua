return {
    'folke/snacks.nvim',
    -- Load plugin early on during startup
    lazy = false,
    priority = 1000,
    dependencies = {
        -- Icon support
        { 'echasnovski/mini.icons', config = true, },
    },
    opts = {
        -- Disable Treesitter and LSP for massive files
        bigfile = { enabled = true, },
        -- Enable the startup dashboard
        dashboard = { enabled = true, },
        -- Enable file explorer (picker)
        explorer = { enabled = true, },
        -- Support in-terminal image/document viewing
        image = { enabled = true, },
        -- Enable indent/scope guide lines
        indent = { enabled = true, },
        -- Enable improved vim.ui.input
        input = { enabled = true, },
        -- Enable improved vim.notify
        notifier = { enabled = true, },
        -- Enable fuzzy pickers
        picker = { enabled = true, },
        -- Enable smooth-scrolling
        scroll = { enabled = true, },
        -- Highlight hovered LSP references
        words = { enabled = true, },
    },
}
