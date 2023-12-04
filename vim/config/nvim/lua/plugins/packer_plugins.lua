
if true then return {
} 
end

-- Добавляем Packer как пакет в Neovim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
 
  -- Темная тема
  use 'dracula/vim'
 
  -- Автоматическое добавление закрфывающих скобок на Enter
  use 'rstacruz/vim-closer'
  -- Автоматическое определение размера отступов в файле
  use 'tpope/vim-sleuth'
  -- Автодополнение
  use 'hrsh7th/nvim-cmp'
  -- Стартовая страница
  use 'mhinz/vim-startify'
  -- Отображение отступов
  use 'lukas-reineke/indent-blankline.nvim'
  -- Статус панель внизу
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
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

