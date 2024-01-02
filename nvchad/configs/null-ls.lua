local null_ls = require('null-ls')

local sources = {
    -- lua
    null_ls.builtins.formatting.stylua,

    -- cpp
    null_ls.builtins.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        async = false,
                        filter = function(CLIENT)
                            return CLIENT.name == 'null-ls'
                        end,
                    })
                end,
            })
        end
    end,
})
