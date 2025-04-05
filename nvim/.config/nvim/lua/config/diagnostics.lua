-- Set diagnostic configuration
vim.diagnostic.config({
    -- Show diagnostic messages as virtual text on the line of concern
    virtual_text = true,
    float = {
        -- Show diagnostic source in the diagnostic floating window
        source = true,
    },
})

-- Use <C-k> to show the hovered diagnostic in a floating window
-- when in Normal and Visual mode
vim.keymap.set({'n', 'v'}, '<C-k>', vim.diagnostic.open_float, { desc = 'Show hovered diagnostic in floating window', })
