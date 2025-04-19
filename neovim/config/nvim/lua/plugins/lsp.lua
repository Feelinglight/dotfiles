local icons = require("config").defaults.icons

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
        virtual_text = {
          spacing = 4,
          prefix = "●",
          -- source = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
          },
        },
      },

      -- add any global capabilities here
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },

      servers = {
        -- Lua
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

        -- shell
        bashls = {},

        -- python
        pyright = {},
        ruff = {},

        -- Plain
        -- TODO: Настроить
        marksman = {},
        esbonio = {},

        -- Yaml
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              format = {
                enable = true,
                proseWrap = 120,
              },
              validate = true,
              editor = {
                tabSize = 4,
                -- formatOnType = true,
              },
              schemas = {
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "**/*compose.yaml",
              },
              schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
              }
            }
          }
        },

        -- TODO: настроить (чтобы работало на файлах с окончанием compose.yaml)
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service
        -- docker_compose_language_service = {},

        clangd = {},
        cmake = {},
        -- C++
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
        -- clangd = {},
        -- cmake = {},
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
    build = ":MasonUpdate",
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
        "yaml-language-server",
        "esbonio",
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
