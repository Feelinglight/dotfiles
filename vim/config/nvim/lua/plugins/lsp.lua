return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        severity_sort = true,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              }
            }
          },
          -- Сейчас не обрабатывается
          keys = {}
        }
      }
    },
    config = function(_, opts)

      -- diagnostics
      for name, icon in pairs(require("config").defaults.icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      local servers = opts.servers
      -- lspconfig = require('lspconfig').setup()
      -- lspconfig.pyright.setup()
    end,
  },
}
