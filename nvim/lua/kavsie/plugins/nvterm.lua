return {
    'NvChad/nvterm',
    config = function()
        require('nvterm').setup({
            terminals = {
                type_opts = {
                    float = {
                        relative = 'editor',
                        row = 0.15,
                        col = 0.125,
                        width = 0.75,
                        height = 0.6,
                        border = 'single',
                    },
                },
            },
        })

        local map = require('kavsie.core.utils').map
        map({ 'n', 't' }, '<A-i>', function()
            require('nvterm.terminal').toggle('float')
        end, {
            desc = 'Toggle Floating Terminal',
        })
        map('t', '<C-x>', '<C-\\><C-N>', {
            desc = 'Escape terminal mode',
        })
    end,
}
