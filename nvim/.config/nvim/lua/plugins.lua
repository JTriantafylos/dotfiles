-- Boostrap routine for lazy.nvim package manager
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    })
end
vim.opt.runtimepath:prepend(lazy_path)

-- lazy.nvim configuration
local lazy_config = {
    defaults = {
        version = "*", -- Install the latest stable version of plugins that support Semver
    },
    checker = {
        enabled = true, -- Enable automatic plugin update checking
    },
}

-- lazy.nvim plugin specification
local lazy_plugin_spec = {
    -- Treesitter functionality
    "nvim-treesitter/nvim-treesitter",

    -- Treesitter text objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },

    -- LSP configuration
    "neovim/nvim-lspconfig",

    -- Autocompletion for nvim-lsp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path", -- file path source for nvim-cmp
            "onsails/lspkind-nvim", -- Completion menu icons
        },
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim", -- Telescope for UI selections (e.g., code actions)
            "nvim-lua/plenary.nvim", -- Common lua library
            "nvim-tree/nvim-web-devicons", -- Icons
            { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }, -- fzf implementation in C
        },
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- Icons
        },
    },

    -- Statusline codecrumbs component
    {
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },

    -- Git decorations
    "lewis6991/gitsigns.nvim",

    -- Comment helper
    "numToStr/Comment.nvim",

    -- Catppuccin colorschemes
    "catppuccin/nvim",

    -- Cusor highlight beacon
    "rainbowhxch/beacon.nvim",

    -- Indentation guides
    "lukas-reineke/indent-blankline.nvim",

    --
    {
        "ggandor/lightspeed.nvim",
        dependencies = {
            "tpope/vim-repeat", -- Enable proper dot-repeat functionality
        },
    },

    -- LSP outline
    "stevearc/aerial.nvim",
}

-- lazy.nvim setup
require("lazy").setup(lazy_plugin_spec, lazy_config)
