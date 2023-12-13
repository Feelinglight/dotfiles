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

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers

      local function setup(server)
        require("lspconfig")[server].setup(servers[server])
      end

      mlsp = require('mason-lspconfig')
      all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {} 

      for server, server_opts in pairs(servers) do
        if server_opts then
          ensure_installed[#ensure_installed + 1] = server
        end
      end
      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })

    end,
  },
}
