return {
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = 'VeryLazy',
        config = function()
            require('custom.configs.null-ls')
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.configs.lspconfig')
            require('custom.configs.lspconfig')
        end,
    },
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                -- lua stuff
                'lua-language-server',
                'stylua',

                -- c[pp] stuff
                'clangd',
                'clang-format',
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
        opts = {
            ensure_installed = {
                'lua',
                'c',
                'cpp',
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                disable = {
                    'python',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                    },
                },
            },
        },
    },
    {
        'nvim-tree/nvim-tree.lua',
        opts = {
            git = {
                enable = true,
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
            },
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            show_current_context = false,
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        opts = {
            extensions_list = {
                'fzf',
                'themes',
                'terms',
            },
        },
    },
    {
        'hrsh7th/nvim-cmp',
        opts = {
            completion = {
                completeopt = 'menu,menuone,noselect',
            },
            sources = {
                {
                    name = 'nvim_lsp',
                },
                {
                    name = 'luasnip',
                },
                {
                    name = 'copilot',
                },
                {
                    name = 'buffer',
                },
                {
                    name = 'nvim_lua',
                },
                {
                    name = 'path',
                },
            },
        },
    },
    {
        'zbirenbaum/copilot-cmp',
        dependencies = {
            'zbirenbaum/copilot.lua',
            opts = {
                suggestion = {
                    enabled = false,
                },
                panel = {
                    enabled = false,
                },
            },
            config = true,
        },
        config = true,
        event = {
            'InsertEnter',
            'LspAttach',
        },
    },
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        opts = {},
    },
    {
        'tpope/vim-sleuth',
        event = 'VeryLazy',
    },
}
