vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard:prepend({ "unnamedplus" })
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"wellle/targets.vim",
		lazy = false,
	},
	{
		"kylechui/nvim-surround",
		lazy = false,
	},
})

local map = function(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<Space>", "<Nop>")
map("v", "<Space>", "<Nop>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
