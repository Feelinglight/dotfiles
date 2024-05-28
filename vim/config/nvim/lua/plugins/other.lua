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

    -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    },
    main = "ibl",
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup()
    end,
    keys = {
      { "]t", "<cmd>BufferLineMoveNext<cr>", desc = "Reorder tab next" },
      { "[t", "<cmd>BufferLineMovePrev<cr>", desc = "Reorder tab back" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Go to next tab" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Go to prev tab" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick tab" },
      { "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others tabs" },
      { "<leader>bb", "<cmd>e #<cr>", desc = "Switch to prev Buffer" },
      { "<leader>bd", "<cmd>:bp<bar>sp<bar>bn<bar>bd<cr>", desc = "Delete Buffer" },
      { "<leader>bD", "<cmd>:bd<cr>", desc = "Delete Buffer and Window" },
    }
  }
}

