return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        -- Decrease update time
        vim.opt.timeout = true
        vim.opt.timeoutlen = 250
        vim.opt.updatetime = 250
    end,
    opts = {},
}
