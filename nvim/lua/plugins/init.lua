return {
  {
    "folke/which-key.nvim",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    event = "BufWritePre",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "go",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
  },
  {
    "wellle/targets.vim",
    event = "BufWritePre",
  },
}
