return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
        "shellcheck",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    enable = false,
    opts = {
      servers = {
        bashls = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        cpp = {
          sh = {
            "shellcheck",
          },
        },
      },
    },
  },

  {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          sh = { "shfmt" },
        },
      },
    },
  },
}
