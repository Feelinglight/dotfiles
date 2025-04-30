return {
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
}
