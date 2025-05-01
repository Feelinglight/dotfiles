return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "shfmt",
      "yamllint",
      "cmakelint",
      "shellcheck",
      "yaml-language-server",
      "esbonio",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {

      servers = {
        -- shell
        bashls = {},

        -- Plain
        marksman = {},
        esbonio = {},

        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service
        -- docker_compose_language_service = {},
        -- dockerls = {},

        -- C++
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
        clangd = {},
        cmake = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Все линтеры должны быть установлены через mason в lsp.lua, либо вручную, если в
        -- Mason их установка не поддерживается!!!
        -- cpp = { "clangtidy" },
        -- yaml = { "yamllint" },
        -- cmake = { "cmakelint" },
        -- sh = { "shellcheck" },

        -- Use the "*" filetype to run linters on all filetypes.
        ["*"] = {},
      },
    },
  },

  {
    {
      "stevearc/conform.nvim",
      ---@type conform.setupOpts
      opts = {
        formatters_by_ft = {
          sh = { "shfmt" },
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
          -- shfmt = {
          --   prepend_args = { "-i", "2", "-ci" },
          -- },
        },
      },
    },
  },
}
