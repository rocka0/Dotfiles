return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "BufWritePre",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "wellle/targets.vim",
    event = "BufWritePre",
  },
}
