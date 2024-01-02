local M = {}

M.disabled = {
    n = {
        ['<C-c>'] = '', -- <C-a>
        ['<leader>D'] = '', -- gt
        ['<leader>ca'] = '', -- <leader>la
        ['<leader>cc'] = '', -- disabled
        ['<leader>cm'] = '', -- <leader>gc
        ['<leader>e'] = '', -- disabled
        ['<leader>f'] = '', -- <leader>ld
        ['<leader>fa'] = '', -- disabled
        ['<leader>fm'] = '', -- <leader>lf
        ['<leader>fo'] = '', -- disabled
        ['<leader>fz'] = '', -- disabled
        ['<leader>gt'] = '', -- <leader>gs
        ['<leader>ls'] = '', -- <leader>lh
        ['<leader>ma'] = '', -- disabled
        ['<leader>pt'] = '', -- disabled
        ['<leader>ra'] = '', -- <leader>lr
        ['<leader>rn'] = '', -- disabled
    },
}

M.general = {
    n = {
        ['<C-d>'] = {
            '<C-d>zzzv',
            'Scroll down 1/2 page centered',
        },
        ['<C-u>'] = {
            '<C-u>zzzv',
            'Scroll up 1/2 page centered',
        },
        ['<C-f>'] = {
            '<C-f>zzzv',
            'Scroll down 1 page centered',
        },
        ['<C-b>'] = {
            '<C-b>zzzv',
            'Scroll up 1 page centered',
        },
        ['n'] = {
            'nzzzv',
            'Move to next search match centered',
        },
        ['N'] = {
            'Nzzzv',
            'Move to previous search match centered',
        },
    },
    v = {
        ['<Space>'] = {
            '<Nop>',
            'Helps with <leader> mappings',
        },
        ['J'] = {
            ":m '>+1<CR>gv=gv",
            'Move line down',
            opts = {
                silent = true,
            },
        },
        ['K'] = {
            ":m '<-2<CR>gv=gv",
            'Move line up',
            opts = {
                silent = true,
            },
        },
        ['<'] = {
            '<gv',
            'Shift text left',
            opts = {
                silent = true,
            },
        },
        ['>'] = {
            '>gv',
            'Shift text right',
            opts = {
                silent = true,
            },
        },
    },
}

M.lspconfig = {
    n = {
        ['<leader>lh'] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            'LSP signature help',
        },
        ['gt'] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            'LSP definition type',
        },
        ['<leader>lr'] = {
            function()
                require('nvchad.renamer').open()
            end,
            'LSP rename',
        },
        ['<leader>la'] = {
            function()
                vim.lsp.buf.code_action()
            end,
            'LSP code actions',
        },
        ['<leader>ld'] = {
            function()
                vim.diagnostic.open_float({ border = 'rounded' })
            end,
            'LSP floating diagnostics',
        },
        ['<leader>lf'] = {
            function()
                vim.lsp.buf.format({ async = true })
            end,
            'LSP formatting',
        },
    },
}

M.nvimtree = {
    n = {
        ['<leader>n'] = {
            '<cmd> NvimTreeFocus <CR>',
            'Focus nvimtree',
        },
    },
}

M.telescope = {
    n = {
        ['<leader>fc'] = {
            '<cmd> Telescope current_buffer_fuzzy_find <CR>',
            'Find in current buffer',
        },
        ['<leader>gc'] = {
            '<cmd> Telescope git_commits <CR>',
            'Git commits',
        },
        ['<leader>gs'] = {
            '<cmd> Telescope git_status <CR>',
            'Git status',
        },
    },
}

return M
