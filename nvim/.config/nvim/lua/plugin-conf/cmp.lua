local cmp = require('cmp')
local lspkind = require('lspkind')

-- Setup
cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    },
    formatting = {
        -- Enable lspkind completion menu formatting
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
                nvim_lsp = '[LSP]',
                path = '[Path]',
                buffer = '[Buffer]',
            })
        }),
    },
}
