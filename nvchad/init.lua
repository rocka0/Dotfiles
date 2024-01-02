-- Map localleader to space
vim.g.maplocalleader = ' '

-- Set the clipboard to be WSL compatible
vim.g.clipboard = {
    name = 'wsl-clipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
}

-- Decrease update time
vim.opt.timeout = true
vim.opt.timeoutlen = 250
vim.opt.updatetime = 250

-- Set highlight on search off
vim.opt.hlsearch = false

-- Set line numbering on
vim.opt.number = true

-- Set relative line numbering on
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- Preview incremental substitute
vim.opt.inccommand = 'nosplit'

-- Size of an indent
vim.opt.shiftwidth = 4

-- Expand tabs to spaces
vim.opt.expandtab = true

-- Command-line completion mode
vim.opt.wildmode = 'longest:full,full'

-- Set the luasnips directory
vim.g.lua_snippets_path = vim.fn.stdpath('config') .. '/lua/custom/snippets'
