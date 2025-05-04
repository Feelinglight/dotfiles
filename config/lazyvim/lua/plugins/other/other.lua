return {
  -- Автоматическое определение размера отступов в файле
  { "tpope/vim-sleuth" },
  -- Shortcats для работы с обрамляющими скобками, кавычками и т. д.
  { "tpope/vim-surround" },
  -- Делает возможным использования . с vim-surround
  { "tpope/vim-repeat" },

  -- -- Перед отменой переместить курсор на место отмены
  {
    "EtiamNullam/gradual-undo.nvim",
    enabled = false,
    config = function()
      require("gradual-undo").setup()
    end,
  },
}
