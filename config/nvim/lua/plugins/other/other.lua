return {
  -- Автоматическое определение размера отступов в файле
  { "tpope/vim-sleuth" },

  -- Перед отменой переместить курсор на место отмены
  {
    "EtiamNullam/gradual-undo.nvim",
    enabled = false,
    config = function()
      require("gradual-undo").setup()
    end,
  },
}
