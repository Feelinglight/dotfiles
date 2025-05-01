return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "yamllint",
        "yaml-language-server",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- yaml = { "yamllint" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
              },
            },
          },
        },
      },
    },
  },
}
