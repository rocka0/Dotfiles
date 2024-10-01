return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'cpp',
                'go',
                'lua',
                'vim',
                'vimdoc',
            },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = {
                enable = true,
                disable = {
                    'python',
                },
            },
        })
    end,
}
