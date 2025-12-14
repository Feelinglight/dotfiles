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
    "neovim/nvim-lspconfig",
    opts = {
      rust_analyzer = { enable = true },
    },
  },

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

  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Debug settings
      local dap = require("dap")
      dap.configurations.rust = {
        {
          name = "Launch bin",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          -- runInTerminal = false,
        },
      }
    end,
  },

  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup({})
    end,
  },
}
