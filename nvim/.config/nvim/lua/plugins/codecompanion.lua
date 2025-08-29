
return {
    'olimorris/codecompanion.nvim',
    lazy = false,
    dependencies = {
        -- Lua utility library
        'nvim-lua/plenary.nvim',
        -- Extended treesitter support
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        strategies = {
            -- Use Qwen2.5-Coder model for all strategies
            chat = {
                adapter = 'qwen',
            },
            inline = {
                adapter = 'qwen',
            },
            cmd = {
                adapter = 'qwen',
            },
        },
        adapters = {
            http = {
                opts = {
                    -- Don't show any default adapters during runtime adapter selection
                    show_defaults = false,
                },
                -- Configure Qwen2.5-Coder Ollama model adapter
                qwen = function()
                    return require('codecompanion.adapters').extend('ollama', {
                        name = 'qwen',
                        schema = {
                            model = {
                                default = 'qwen2.5-coder:7b-instruct',
                            },
                            num_ctx = {
                                default = 16384,
                            },

                            -- Use Qwen's recommended parameters
                            -- https://huggingface.co/Qwen/Qwen2.5-Coder-7B-Instruct/blob/main/generation_config.json
                            repeat_penalty = {
                                default = 1.1,
                            },
                            temperature = {
                                default = 0.7,
                            },
                            top_p = {
                                default = 0.8,
                            },
                            top_k = {
                                default = 20,
                            },
                        },
                    })
                end,
            },
        },
    },
    keys = {
        { '<leader>i', function() require('codecompanion').toggle() end, desc = 'Toggle CodeCompanion AI chat buffer', },
        { '<leader>A', function() require('codecompanion').actions() end, mode = { 'n', 'v' }, desc = 'Invoke CodeCompanion AI action palette', },
    },
}
