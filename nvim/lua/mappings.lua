require("nvchad.mappings")

-- Unmap some NvChad defaults
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>ds")
vim.keymap.del("n", "<leader>e")
vim.keymap.del("n", "<leader>gt")
vim.keymap.del("n", "<leader>ma")
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>pt")
vim.keymap.del("n", "<leader>rn")
vim.keymap.del("n", "<leader>wK")
vim.keymap.del("n", "<leader>wk")
vim.keymap.del({ "n", "x" }, "<leader>fm")

-- A helper function to easily declare keymappings.
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

map("n", "<C-s>", "<cmd>w<CR><ESC>", {
  desc = "Save file",
})

map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward].'zzzv'", {
  expr = true,
  desc = "[N]ext Search Result",
})

map({ "n", "x", "o" }, "N", "'nN'[v:searchforward].'zzzv'", {
  expr = true,
  desc = "Previous Search Result",
})

map("v", "<", "<gv", {
  desc = "Better indent left in visual mode.",
})

map("v", ">", ">gv", {
  desc = "Better indent right in visual mode.",
})

map("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move visually selected lines down.",
})

map("v", "K", ":m '<-2<CR>gv=gv", {
  desc = "Move visually selected lines up.",
})

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = "Move down handling word wrap",
})

map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = "Move up handling word wrap",
})

map("n", "<leader>fm", "<cmd>Telescope marks<CR>", {
  desc = "Telescope [F]ind [M]arks",
})

map("n", "<leader>ft", "<cmd>Telescope terms<CR>", {
  desc = "Telescope [F]ind [T]erminals",
})
