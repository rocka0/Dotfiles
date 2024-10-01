return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        require('mason').setup({
            ui = {
                icons = {
                    package_pending = ' ',
                    package_installed = '󰄳 ',
                    package_uninstalled = ' 󰚌',
                },
            },
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',
                'gopls',
                'lua_ls',
            },
        })
        require('mason-tool-installer').setup({
            ensure_installed = {
                'goimports',
                'stylua',
            },
        })
    end,
}
