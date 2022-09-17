local lspconfig = require('lspconfig')

-- Keybinds

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Each LSP server setup method must set on_attach equal to this function
local on_attach = function(_, bufnr)
    local bufopts = { buffer=bufnr }
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
    vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols, bufopts)
    vim.keymap.set('n', 'gh', '<cmd>ClangdSwitchSourceHeader<CR>', bufopts)
end

-- Initialize cmp-nvim-lsp capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup clangd LSP server
require('clangd_extensions').setup{
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
}

-- Setup jedi-language-server
lspconfig.jedi_language_server.setup{
    on_attach = on_attach
}

-- Setup typescript-language-server
lspconfig.tsserver.setup{
    on_attach = on_attach
}


-- Setup ESLint LSP server
lspconfig.eslint.setup{
    on_attach = on_attach
}


-- Setup Lua runetime path
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Setup Lua-Language-Server
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
