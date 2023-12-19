return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
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
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
              },
            },
          },
          -- Сейчас не обрабатывается
          keys = {},
        },

        pyright = {},
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

      local on_attach = require("plugins.lsp.keymaps").on_attach
      local capabilities = require("plugins.lsp.keymaps").capabilities

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          on_attach = on_attach,
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      local mlsp = require('mason-lspconfig')

      local ensure_installed = {}

      for server, server_opts in pairs(servers) do
        if server_opts then
          ensure_installed[#ensure_installed + 1] = server
        end
      end
      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })

    end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function(_, opts)
      require("mason").setup(opts)
    end
  },
}
