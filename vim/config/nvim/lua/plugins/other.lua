return {
  -- Автоматическое определение размера отступов в файле
  { 'tpope/vim-sleuth' },
  -- Shortcats для работы с обрамляющими скобками, кавычками и т. д.
  { 'tpope/vim-surround' },
  -- Делает возможным использования . с vim-surround
  { 'tpope/vim-repeat' },

  -- Поиск выделенных символов по *
  { 'bronson/vim-visual-star-search' },

  -- Автоматическое закрытие скобок на enter
  -- { 'rstacruz/vim-closer' },

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

