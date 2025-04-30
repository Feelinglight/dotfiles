return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "mypy",
        "ruff",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    enable = false,
    opts = {
      servers = {
        pyright = {},
        ruff = {},
      },
    },
  },
}
