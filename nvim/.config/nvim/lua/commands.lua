-- User command to format the current buffer 
vim.api.nvim_create_user_command("Format",
    function() vim.lsp.buf.format() end,
    { desc = "Format the current buffer using the attached language server clients", })
