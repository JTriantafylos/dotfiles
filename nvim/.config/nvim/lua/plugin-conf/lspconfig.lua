local lspconfig = require('lspconfig')

-- Keybinds

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Each LSP server setup method must set on_attach equal to this function
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local telescope = require('telescope.builtin')
        local bufopts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,             bufopts)
        vim.keymap.set('n', 'K',          vim.lsp.buf.hover,                   bufopts)
        vim.keymap.set('n', '<C-k>',      vim.lsp.buf.signature_help,          bufopts)
        vim.keymap.set('n', '<CS-K>',     vim.diagnostic.open_float,           bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,                  bufopts)
        vim.keymap.set('n', '<leader>a',  vim.lsp.buf.code_action,             bufopts)
        vim.keymap.set('n', 'gi',         telescope.lsp_implementations,       bufopts)
        vim.keymap.set('n', 'gd',         telescope.lsp_definitions,           bufopts)
        vim.keymap.set('n', 'gr',         telescope.lsp_references,            bufopts)
        vim.keymap.set('n', '<leader>s',  telescope.lsp_document_symbols,      bufopts)
        vim.keymap.set('n', 'gh',         '<cmd>ClangdSwitchSourceHeader<CR>', bufopts)
        vim.keymap.set('n', '[d',         vim.diagnostic.goto_prev,            bufopts)
        vim.keymap.set('n', ']d',         vim.diagnostic.goto_next,            bufopts)
    end
})

-- Setup clangd LSP server
-- require('clangd_extensions').setup {}
lspconfig.clangd.setup {}

-- Setup rust-analyzer LSP server
lspconfig.rust_analyzer.setup {}

-- Setup pyright LSP server
lspconfig.pyright.setup {}

-- Setup typescript-language-server
lspconfig.tsserver.setup {}

-- Setup vue-language-server
lspconfig.volar.setup {}

-- Setup ESLint LSP server
lspconfig.eslint.setup {}

-- Setup Lua runetime path
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Setup Lua-Language-Server
lspconfig.lua_ls.setup {
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
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
