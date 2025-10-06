return {
  {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "rust-analyzer",
          "rustfmt",
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        rist = { "clippy" },
      },
    },
  },

  {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          rust = { "rustfmt", lsp_format = "fallback" },
        },
      },
    },
  },
}
