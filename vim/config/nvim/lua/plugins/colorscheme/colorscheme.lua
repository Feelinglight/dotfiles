-- Цветовые схемы

return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "moon" },
    config = function()

      -- https://jdhao.github.io/2020/09/22/highlight_groups_cleared_in_nvim/
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "tokyonight",
        callback = function()
          local colors = require('plugins.colorscheme.darcula.colors')
          vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.maple_syrup })
        end,
      })
      vim.cmd.colorscheme('tokyonight')

    end,
  },

  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()

      -- vim.api.nvim_create_autocmd("ColorScheme", {
      --   pattern="*",
      --   callback = function()
      --     require('plugins.colorscheme.darcula.gitsigns')
      --     require('plugins.colorscheme.darcula.telescope')
      --     require('plugins.colorscheme.darcula.neo-tree')
      --   end,
      -- })
      -- vim.cmd.colorscheme('darcula-dark')

    end,
  }

}

