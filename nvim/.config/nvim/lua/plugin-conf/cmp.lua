local cmp = require('cmp')

-- Setup
cmp.setup {
    sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    },
    formatting = {
    },
    snippet = {
        -- Enable vsnip snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
}
