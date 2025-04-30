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

        -- C++
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
        clangd = {},
        cmake = {},
      },
    },
  },
}
