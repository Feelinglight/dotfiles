return {
  -- Автоматическое определение размера отступов в файле
  { 'tpope/vim-sleuth' },
  -- Shortcats для работы с обрамляющими скобками, кавычками и т. д.
  { 'tpope/vim-surround' },
  -- Делает возможным использования . с vim-surround
  { 'tpope/vim-repeat' },

  -- Автоматическое закрытие скобок на enter
  { 'rstacruz/vim-closer' },

  -- Shortcats для быстрого комментирования строк
  { 
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup()
    end
  },

  -- Подсветка слова под курсором
  {
    'echasnovski/mini.nvim',
    lazy = false,
    config = function()
      require('mini.cursorword').setup()
      -- Отключает подсветку текущего слова, подсвечивает все остальные
      vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { guifg = nil, guibg = nil, gui = nil, cterm = nil })
    end
  },


  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup()
    end
  }
}

