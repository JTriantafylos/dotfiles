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
            'onsails/lspkind-nvim', -- Completion menu icons
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

    -- Bufferline
    use {
        'akinsho/bufferline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons' -- Icons
        },
        config = function()
            require('bufferline').setup()
        end
    }

    -- Statusline codecrumbs component
    use {
        'SmiteshP/nvim-gps',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        },
    }

    -- Treesitter context
    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        },
    }

    -- Git decorations
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Comment helper
    use 'numToStr/Comment.nvim'

    -- base16 colorschemes with nvim-treesitter compatability
    use 'RRethy/nvim-base16'

    -- Cusor highlight beacon
    use 'rainbowhxch/beacon.nvim'

    -- Indentation guides
    use 'lukas-reineke/indent-blankline.nvim'

    -- Markdown preview
    use 'ellisonleao/glow.nvim'
end)
