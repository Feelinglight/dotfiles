-- mason: <Space>cm
-- nvim-lspconfig: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- nvim-lint: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
-- conform: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters

-- Все линтеры/форматтеры/lsp должны быть установлены через mason , либо вручную, если в
-- Mason их установка не поддерживается!!!

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- ast-grep
        -- html
        -- jinja
        -- lsp_ai
        -- nginx
        -- sql
        -- systemd

        "esbonio",
        "marksman",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {

      servers = {
        -- Plain
        marksman = {},
        esbonio = {},

        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service
        -- docker_compose_language_service = {},
        -- dockerls = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Use the "*" filetype to run linters on all filetypes.
        ["*"] = {},
      },
    },
  },

  {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          fish = { "fish_indent" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          shfmt = {
            prepend_args = { "-i", "2", "-ci" },
          },
        },
      },
    },
  },
}
