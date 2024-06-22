-- Цветовые схемы

return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "moon" },
    config = function()
      -- vim.cmd.colorscheme('tokyonight')
    end,
  },

  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern="*",
        callback = function()
          require('plugins.colorscheme.darcula.gitsigns')
        end,
      })

      vim.cmd.colorscheme('darcula-dark')
    end,
  }

}

