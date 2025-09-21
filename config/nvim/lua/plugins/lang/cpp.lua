return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "cpplint",
        "cmakelint",
        "cmakelang",
        "codelldb",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    enable = false,
    opts = {
      servers = {
        clangd = {
          keys = {
            {
              "<leader>h",
              "<cmd>ClangdSwitchSourceHeader<cr>",
              desc = "Switch Source/Header (C/C++)",
            },
          },
        },
        cmake = {},
        neocmake = {},
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
