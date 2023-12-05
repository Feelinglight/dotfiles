return {
  -- Автоматическое определение размера отступов в файле
  { 'tpope/vim-sleuth' },
  -- Shortcats для работы с обрамляющими скобками, кавычками и т. д.
  { 'tpope/vim-surround' },
  -- Делает возможным использования . с vim-surround
  { 'tpope/vim-repeat' },

  -- Shortcats для быстрого комментирования строк
  { 
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup()
    end
  },

}

