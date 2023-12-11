return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
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
          }
        }
      }
    },
    config = function(_, opts)
      local servers = opts.servers
      -- lspconfig = require('lspconfig').setup()
      -- lspconfig.pyright.setup()
    end,
  },

  { 
    "williamboman/mason.nvim",
    lazy=false,
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      }
    },
    config = function(_, opts)
      require('mason').setup(opts)
    end,
  },

  { 
    "williamboman/mason-lspconfig.nvim",
    lazy=false,
    config = function()
      require('mason-lspconfig').setup({
        automatic_installation = true,
      })
    end,
  },

}
