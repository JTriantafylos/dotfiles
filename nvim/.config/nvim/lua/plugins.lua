vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
    -- Neovim package manager
    use 'wbthomason/packer.nvim'

    -- Treesitter functionality
    use 'nvim-treesitter/nvim-treesitter'

    -- LSP configuration
    use 'neovim/nvim-lspconfig'

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
            'nvim-tree/nvim-web-devicons', -- Icons
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }, -- fzf implementation in C
        },
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons', -- Icons
        },
    }

    -- Statusline codecrumbs component
    use {
        'SmiteshP/nvim-navic',
        requires = {
            'nvim-treesitter/nvim-lspconfig',
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
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Catppuccin colorschemes
    use {
        'catppuccin/nvim',
        as = 'catppuccin'
    }

    -- Cusor highlight beacon
    use 'rainbowhxch/beacon.nvim'

    -- Indentation guides
    use 'lukas-reineke/indent-blankline.nvim'
end)
