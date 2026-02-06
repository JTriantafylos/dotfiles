-- Enable the configured LSP servers
-- These configurations depend on nvim-lspconfig
vim.lsp.enable({
    'clangd',  -- Enable clangd for C/C++ development
    'luals',   -- Enable lua-language-server for Lua development
    'basedpyright',    -- Enable basedpyright for Python development
    'ruff',            -- Enable ruff for Python development
    'rust-analyzer',   -- Enable rust-analyzer for Rust development
})

-- Use <leader>-a to show the code actions palette when in Normal mode
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Show code actions palette', })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename hovered symbol', })
