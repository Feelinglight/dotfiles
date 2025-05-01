return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "cpplint",
        "cmakelint",
        "cmakelang",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    enable = false,
    opts = {
      servers = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
        clangd = {},
        cmake = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        cpp = {
          -- "clang-tidy",
          "cpplint",
        },
        cmake = {
          "cmakelint",
        },
      },
    },
  },

  {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          cpp = {
            "clang-format",
          },
          cmake = {
            "cmakelang",
          },
        },
      },
    },
  },
}
