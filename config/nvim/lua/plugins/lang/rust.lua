return {
  {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "rustfmt",
        },
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
    "mrcjkb/rustaceanvim",
    enable = true,
    version = "^6",
    lazy = false, -- This plugin is already lazy
    init = function()
      vim.g.rustaceanvim = {
        server = {
          -- capabilities взяты из rust-analyzer от nvim-lspconfig
          -- основная причина - опция insertReplaceSupport. Если установить ее в true, то
          -- автокомплит не будет заменять текст после курсора
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  commitCharactersSupport = false,
                  deprecatedSupport = true,
                  documentationFormat = { "markdown", "plaintext" },
                  insertReplaceSupport = true,
                  insertTextModeSupport = {
                    valueSet = { 1 },
                  },
                  labelDetailsSupport = true,
                  preselectSupport = false,
                  resolveSupport = {
                    properties = {
                      "documentation",
                      "detail",
                      "additionalTextEdits",
                      "command",
                      "data",
                    },
                  },
                  snippetSupport = true,
                  tagSupport = {
                    valueSet = { 1 },
                  },
                },
                completionItemKind = {
                  valueSet = {
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                    16,
                    17,
                    18,
                    19,
                    20,
                    21,
                    22,
                    23,
                    24,
                    25,
                  },
                },
                completionList = {
                  itemDefaults = {
                    "commitCharacters",
                    "editRange",
                    "insertTextFormat",
                    "insertTextMode",
                    "data",
                  },
                },
                contextSupport = true,
                dynamicRegistration = false,
                insertTextMode = 1,
              },
            },
          },
        },
      }
    end,
  },
}
