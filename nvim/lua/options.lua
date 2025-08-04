require("nvchad.options")

-- Sync MacOS clipboard with nvim clipboard.
vim.opt.clipboard:prepend({ "unnamedplus" })

-- Set line numbering on
vim.opt.number = true

-- Set relative line numbering on
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Set highlight on search off
vim.opt.hlsearch = false

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- Preview incremental substitute
vim.opt.inccommand = "nosplit"

-- Tab and indentation options
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Command-line completion mode
vim.opt.wildmode = "longest:full,full"

-- Global statusline
vim.opt.laststatus = 3
vim.opt.showmode = false

-- Set the cursorline
vim.opt.cursorline = true

-- Set the toggle theme icon
vim.g.toggle_theme_icon = "   "

-- Fillchars
vim.opt.fillchars = {
  eob = " ",
}

-- Split options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- Correct backspace options
vim.opt.backspace = "indent,eol,start"
