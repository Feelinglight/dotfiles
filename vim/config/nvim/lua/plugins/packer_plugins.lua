
-- Добавляем Packer как пакет в Neovim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Автоматическое добавление закрфывающих скобок на Enter
  use 'rstacruz/vim-closer'
  -- Автоматическое определение размера отступов в файле
  use 'tpope/vim-sleuth'
  -- Автодополнение
  use 'hrsh7th/nvim-cmp'
  -- Темна тема
  use 'dracula/vim'
  -- Менеджер файлов
  use 'preservim/nerdtree'
  -- Комментирование файлов
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- LSP сервер
  use 'neovim/nvim-lspconfig'

  -- Иконки для автодополнения
  use {
    'onsails/lspkind-nvim',
  }

end)

