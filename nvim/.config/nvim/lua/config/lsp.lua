-- Configuration for the clangd LSP server
vim.lsp.config('clangd', {
    -- Command to start the clangd server with background indexing
    cmd = { 'clangd', '--background-index' },
    -- Markers to identify the root of the project
    root_markers = { 'compile_commands.json', 'compile_flags.txt' },
    -- File types that this server will handle
    filetypes = { 'c', 'cpp' },
})

-- Configuration for the lua-language-server
vim.lsp.config('luals', {
    -- Command to start the lua-language-server
    cmd = { 'lua-language-server' },
    -- File types that this server will handle
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                -- Specify the Lua version being used (LuaJIT for Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Recognize the `vim` global and other globals
                globals = {
                    'vim',    -- Neovim's API
                    'require' -- Lua's require function
                },
            },
            workspace = {
                -- Include Neovim runtime files in the workspace
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Disable telemetry data collection
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Enable the configured LSP servers
vim.lsp.enable({
    'clangd',  -- Enable clangd for C/C++ development
    'luals',   -- Enable lua-language-server for Lua development
})

-- Use <leader>-a to show the code actions palette when in Normal mode
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Show code actions palette', })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename hovered symbol', })
