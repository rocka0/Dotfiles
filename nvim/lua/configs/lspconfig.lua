local nvlsp = require("nvchad.configs.lspconfig")

nvlsp.on_attach = function(_, bufnr)
  local keymaps = {
    { "n", "gR", "<cmd>Telescope lsp_references<CR>", "[G]oto [R]eferences" },
    { "n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration" },
    { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "[G]oto [D]efinition" },
    { "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "[G]oto [I]mplementation" },
    { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "[G]oto [T]ype Definition" },
    { "n", "K", vim.lsp.buf.hover, "LSP Hover Documentation" },
    { "n", "<leader>la", vim.lsp.buf.code_action, "[L]SP [A]ctions" },
    { "n", "<leader>lr", require("nvchad.lsp.renamer"), "[L]SP [R]ename" },
    { "n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", "[L]SP [D]iagnostics" },
    { "n", "<leader>lR", ":LspRestart<CR>", "[L]SP [R]estart" },
  }

  local function map(mode, lhs, rhs, opts)
    local options = {
      noremap = true,
      silent = true,
      buffer = bufnr,
    }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  for _, km in ipairs(keymaps) do
    map(km[1], km[2], km[3], {
      desc = km[4],
    })
  end
end

nvlsp.defaults()

for type, icon in pairs({
  Error = " ",
  Warn = " ",
  Hint = "󰠠 ",
  Info = " ",
}) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.enable("clangd")
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=never",
  },
})
