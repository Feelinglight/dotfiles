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
        underline = true,
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

        bashls = {},
        pyright = {},
        marksman = {},
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
    opts = {
      PATH = "append",
      ensure_installed = {
        "stylua",
        "shfmt",
        "yamllint",
        "cmakelint",
        "shellcheck",
        "mypy",
        "ruff",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
}
