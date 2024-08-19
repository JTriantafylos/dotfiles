-- Enable spellcheck for Markdown files
vim.api.nvim_create_autocmd('filetype',
    {
        pattern = { 'markdown', 'text' },
        command = 'setlocal spell'
    })
