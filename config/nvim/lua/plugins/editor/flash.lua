return {
  "folke/flash.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = false,
      },
    },
  },
  keys = function()
    -- flash используется только в стандартном поиске, остальные функции не нужны
    return {}
  end,
}
