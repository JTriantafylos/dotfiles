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
        picker = {
            -- Enable fuzzy pickers
            enabled = true,
            win = {
                input = {
                    keys = {
                        -- Close picker on <Esc> rather than exiting to Normal mode
                        ['<Esc>'] = { 'close', mode = { 'n', 'i' }, },
                    },
                },
            },
        },
    },
    keys = {
        -- General Keymaps
        { '<leader><leader>', function() Snacks.picker.pick() end, desc = 'Picker picker', },
        { '<leader>:', function() Snacks.picker.command_history() end, desc = 'Command history', },
        { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification history', },
        { '<leader>c', function() Snacks.picker.commands() end, desc = 'Command picker', },
        { '<leader>u', function() Snacks.picker.undo() end, desc = 'Undo history', },
        { '<leader>h', function() Snacks.picker.help() end, desc = 'Neovim help picker', },
        { '<leader>m', function() Snacks.picker.man() end, desc = 'Manpage picker', },

        -- File Keymaps
        { '<leader>f', function() Snacks.picker.files() end, desc = 'File picker', },
        { '<leader>e', function() Snacks.explorer() end, desc = 'File explorer', },
        { '<leader>b', function() Snacks.picker.buffers() end, desc = 'Buffer picker', },
        { '<leader>g', function() Snacks.picker.grep() end, desc = 'Grep picker', },
        { '<leader>w', function() Snacks.picker.grep_word() end, desc = 'Grep picker for visual selection or hovered word', mode = { 'n', 'x' }, },

        -- LSP Keymaps
        { '<leader>d', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer diagnostics list', },
        { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'LSP references', },
        { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'LSP definitions', },
        { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'LSP declarations', },
        { '<leader>s', function() Snacks.picker.lsp_symbols() end, desc = 'LSP symbols', },
        { '<leader>S', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP workspace symbols', },
        { '<leader>rf', function() Snacks.rename.rename_file() end, desc = 'Rename file', },

        -- Navigation Keymaps
        { ']]', function() Snacks.words.jump(1, false) end, desc = 'Next reference', },
        { '[[', function() Snacks.words.jump(-1, false) end, desc = 'Previous reference', },
    },
}
