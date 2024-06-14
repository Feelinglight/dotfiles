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
    -- lazy = false,
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

  {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 0
      vim.g.strip_whitespace_confirm = 0
      vim.g.better_whitespace_guicolor = 'red'
      vim.g.current_line_whitespace_disabled_soft = 1
      vim.g.better_whitespace_filetypes_blacklist = {'dashboard'}

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          local strip_range = 2000

          local current_row = vim.fn.getpos(".")[2]

          local first_line = math.max(0, current_row - strip_range)
          local last_line = math.min(current_row + strip_range, vim.fn.line('$'))

          vim.cmd(string.format('%s,%sStripWhitespace', first_line, last_line))
        end,
      })

    end
  },

}

