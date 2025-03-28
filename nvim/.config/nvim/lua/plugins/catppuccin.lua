return {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- Load the colorscheme plugin as early as possible
    priority = 1000,
    -- Set colorscheme as soon as plugin is loaded
    init = function()
        vim.cmd.colorscheme('catppuccin')
    end,
}
