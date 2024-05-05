local map = require('kavsie.core.utils').map

map({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Disable <leader> in normal mode.' })

map('n', '<C-s>', '<cmd>w<CR><ESC>', { desc = 'Save file' })

map({ 'n', 'x', 'o' }, 'n', "'Nn'[v:searchforward].'zzzv'", {
    expr = true,
    desc = '[N]ext Search Result',
})
map({ 'n', 'x', 'o' }, 'N', "'nN'[v:searchforward].'zzzv'", {
    expr = true,
    desc = 'Previous Search Result',
})

map('v', '<', '<gv', { desc = 'Better indent left in visual mode.' })
map('v', '>', '>gv', { desc = 'Better indent right in visual mode.' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visually selected lines down.' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visually selected lines up.' })

map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", {
    expr = true,
    desc = 'Move down handling word wrap',
})
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", {
    expr = true,
    desc = 'Move up handling word wrap',
})
