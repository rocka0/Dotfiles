return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'folke/neodev.nvim', opts = {} },
        {
            'j-hui/fidget.nvim',
            config = function()
                require('fidget').setup({
                    notification = {
                        window = {
                            winblend = 0,
                        },
                    },
                })
            end,
        },
    },
    config = function()
        local map = require('tushchen.utils').map
        local util = require('lspconfig/util')
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                map('n', 'gR', '<cmd>Telescope lsp_references<CR>', {
                    buffer = ev.buf,
                    desc = '[G]oto LSP [R]eferences',
                })
                map('n', 'gD', vim.lsp.buf.declaration, {
                    buffer = ev.buf,
                    desc = '[G]oto LSP [D]eclaration',
                })
                map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', {
                    buffer = ev.buf,
                    desc = '[G]oto LSP [d]efinition',
                })
                map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', {
                    buffer = ev.buf,
                    desc = '[G]oto LSP [i]mplementation',
                })
                map('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', {
                    buffer = ev.buf,
                    desc = '[G]oto LSP [t]ype definition',
                })
                map('n', '<leader>la', vim.lsp.buf.code_action, {
                    buffer = ev.buf,
                    desc = '[L]sp Code [A]ctions',
                })
                map('n', '<leader>lr', vim.lsp.buf.rename, {
                    buffer = ev.buf,
                    desc = '[L]sp [r]ename',
                })
                map('n', '<leader>ld', '<cmd>Telescope diagnostics bufnr=0<CR>', {
                    buffer = ev.buf,
                    desc = '[L]sp [D]iagnostics',
                })
                map('n', '[d', vim.diagnostic.goto_prev, {
                    buffer = ev.buf,
                    desc = 'Goto previous LSP [D]iagnostic',
                })
                map('n', ']d', vim.diagnostic.goto_prev, {
                    buffer = ev.buf,
                    desc = 'Goto next LSP [D]iagnostic',
                })
                map('n', 'K', vim.lsp.buf.hover, {
                    buffer = ev.buf,
                    desc = 'Show LSP Documentation',
                })
                map('n', '<leader>lR', ':LspRestart<CR>', {
                    buffer = ev.buf,
                    desc = '[L]sp [R]estart',
                })
            end,
        })
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ['clangd'] = function()
                lspconfig['clangd'].setup({
                    capabilities = capabilities,
                    cmd = {
                        'clangd',
                        '--background-index',
                        '--header-insertion=never',
                    },
                })
            end,
            ['lua_ls'] = function()
                lspconfig['lua_ls'].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                })
            end,
            ['gopls'] = function()
                lspconfig['gopls'].setup({
                    capabilities = capabilities,
                    cmd = { 'gopls' },
                    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
                    settings = {
                        gopls = {
                            completeUnimported = true,
                            usePlaceholders = true,
                        },
                    },
                })
            end,
        })
    end,
}
