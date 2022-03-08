vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
    -- Neovim package manager
    use 'wbthomason/packer.nvim'

    -- Treesitter functionality
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- LSP configuration
    use {
        'neovim/nvim-lspconfig',

        requires = {
            'p00f/clangd_extensions.nvim', -- clangd LSP extensions plugin
        },
    }

    -- Autocompletion for nvim-lsp
    use {
        'hrsh7th/nvim-cmp',

        requires = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
            'hrsh7th/cmp-path', -- file path source for nvim-cmp
            'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
            'L3MON4D3/LuaSnip', -- Snippets plugin
        },
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',

        requires = {
            'nvim-lua/plenary.nvim', -- Common lua library
            'kyazdani42/nvim-web-devicons', -- Icons
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }, -- fzf implementation in C
        },
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', -- Icons
        },
    }

    -- Statusline codecrumbs component
    use {
        'SmiteshP/nvim-gps',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        },
    }

    -- Comment helper
    use 'numToStr/Comment.nvim'

    -- base16 colorschemes with nvim-treesitter compatability
    use 'RRethy/nvim-base16'

    -- Cusor highlight beacon
    use 'danilamihailov/beacon.nvim'
end)
