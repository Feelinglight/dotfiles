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

  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     rust_analyzer = {},
  --   },
  -- },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- rust = { "clippy" },
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
