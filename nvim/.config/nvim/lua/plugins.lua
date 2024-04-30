-- Boostrap routine for lazy.nvim package manager
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazy_path,
    })
end
vim.opt.runtimepath:prepend(lazy_path)

-- lazy.nvim configuration
local lazy_config = {
    defaults = {
        version = '*', -- Install the latest stable version of plugins that support Semver
    },
    checker = {
        enabled = true, -- Enable automatic plugin update checking
        frequency = 259200, -- Check for updates every 3 days
    },
    lockfile = vim.fn.stdpath('state') .. '/lazy/lazy-lock.json', -- Store lockfile in XDG_STATE_HOME
}

-- lazy.nvim plugin specification
local lazy_plugin_spec = {
    -- Treesitter functionality
    {
        'nvim-treesitter/nvim-treesitter',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = 'all',
            highlight = { enable = true },
            incremental_selection = { enable = true },
            indent = { enable = true },
        },
    },

    -- LSP configuration
    'neovim/nvim-lspconfig',

    -- Autocompletion for nvim-lsp
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
            'hrsh7th/cmp-path', -- file path source for nvim-cmp
            'onsails/lspkind-nvim', -- Completion menu icons
        },
    },

    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim', -- Common lua library
            'nvim-tree/nvim-web-devicons', -- Icons
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }, -- fzf implementation in C
        },
    },

    -- Enhancements for vim.ui components
    'stevearc/dressing.nvim',

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'SmiteshP/nvim-navic', -- Codecrumbs
            'nvim-tree/nvim-web-devicons', -- Icons
        },
        opts = {
            sections = {
                lualine_c = {
                    { 'filename' },
                    {
                        function() return require('nvim-navic').get_location() end,
                        cond = function() return require('nvim-navic').is_available() end,
                    },
                },
            },
        },
    },

    -- Statusline codecrumbs component
    {
        'SmiteshP/nvim-navic',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        opts = {
            icons = {
                File          = '󰈙 ',
                Module        = ' ',
                Namespace     = '󰌗 ',
                Package       = ' ',
                Class         = '󰌗 ',
                Method        = '󰆧 ',
                Property      = ' ',
                Field         = ' ',
                Constructor   = ' ',
                Enum          = '󰕘',
                Interface     = '󰕘',
                Function      = '󰊕 ',
                Variable      = '󰆧 ',
                Constant      = '󰏿 ',
                String        = '󰀬 ',
                Number        = '󰎠 ',
                Boolean       = '◩ ',
                Array         = '󰅪 ',
                Object        = '󰅩 ',
                Key           = '󰌋 ',
                Null          = '󰟢 ',
                EnumMember    = ' ',
                Struct        = '󰌗 ',
                Event         = ' ',
                Operator      = '󰆕 ',
                TypeParameter = '󰊄 ',
            },
            lsp = {
                auto_attach = true,
                preference = nil,
            },
            highlight = false,
            separator = ' > ',
            depth_limit = 0,
            depth_limit_indicator = '..',
            safe_output = true,
        },
    },

    -- Git decorations
    {
        'lewis6991/gitsigns.nvim',
        config = true,
    },

    -- Comment helper
    {
        'numToStr/Comment.nvim',
        config = true,
    },

    -- Catppuccin colorschemes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
    },

    -- Cusor highlight beacon
    'rainbowhxch/beacon.nvim',

    -- Indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = true,
    },

    -- Improved motions
    {
        'ggandor/leap.nvim',
        dependencies = {
            'tpope/vim-repeat', -- Enable proper dot-repeat functionality
        },
        main = 'leap',
        config = function(plugin) require(plugin.main).add_default_mappings() end,
    },

    -- LSP outline
    'stevearc/aerial.nvim',
}

-- lazy.nvim setup
require('lazy').setup(lazy_plugin_spec, lazy_config)
