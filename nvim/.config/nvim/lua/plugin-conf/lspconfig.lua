local lspconfig = require('lspconfig')

-- Autocommand called once an LSP client attached to the buffer
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local telescope = require('telescope.builtin')
		local bufopts = { buffer = ev.buf }

		-- Keybinds
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', '<C-k>', vim.diagnostic.open_float, bufopts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', 'gi', telescope.lsp_implementations, bufopts)
		vim.keymap.set('n', 'gd', telescope.lsp_definitions, bufopts)
		vim.keymap.set('n', 'gr', telescope.lsp_references, bufopts)
		vim.keymap.set('n', '<leader>s', telescope.lsp_document_symbols, bufopts)
		vim.keymap.set('n', '<leader>S', telescope.lsp_dynamic_workspace_symbols, bufopts)
		vim.keymap.set('n', 'gh', '<cmd>ClangdSwitchSourceHeader<CR>', bufopts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)

		-- Enable LSP inlay hints
		vim.lsp.inlay_hint.enable()

		-- User command to format the current buffer
		vim.api.nvim_create_user_command("Format",
			function() vim.lsp.buf.format() end,
			{ desc = "Format the current buffer using the attached language server clients", })
	end
})

-- Setup clangd LSP server
lspconfig.clangd.setup {}

-- Setup rust-analyzer LSP server
lspconfig.rust_analyzer.setup {}

-- Setup pyright LSP server
lspconfig.pyright.setup {}

-- Setup typescript-language-server
lspconfig.ts_ls.setup {}

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
				globals = { 'vim' },
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
