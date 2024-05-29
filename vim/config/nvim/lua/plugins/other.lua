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
      require('Comment').setup({
        -- Перемещает курсор на строку ниже после комментирования строки
        post_hook = function(ctx)
          local u = require('Comment.utils')
          if ctx.ctype == u.ctype.linewise and ctx.range.srow == ctx.range.erow then
            vim.api.nvim_win_set_cursor(0, { ctx.range.srow + 1, vim.api.nvim_win_get_cursor(0)[2] })
          end
        end
      })
    end
  },
}

