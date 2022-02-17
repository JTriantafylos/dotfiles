local lspconfig = require('lspconfig')

-- Keybinds
local default_opts = { noremap = true, silent = true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',         '<cmd>lua require(\'telescope.builtin\').lsp_definitions()<CR>', default_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',         '<cmd>lua require(\'telescope.builtin\').lsp_implementations()<CR>', default_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',         '<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>', default_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh',         '<cmd>ClangdSwitchSourceHeader<CR>', default_opts)
end

-- Initialize cmp-nvim-lsp capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup clangd LSP server
require("clangd_extensions").setup {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
}

-- Setup Lua runetime path
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Setup Lua-Language-Server
lspconfig.sumneko_lua.setup {
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
