
if true then return {
} 
end

return require('packer').startup(function(use)
  -- Автоматическое добавление закрфывающих скобок на Enter
  use 'rstacruz/vim-closer'
  -- Автодополнение
  use 'hrsh7th/nvim-cmp'
  -- Отображение отступов
  use 'lukas-reineke/indent-blankline.nvim'
  -- Менеджер файлов
  use 'preservim/nerdtree'
  -- LSP сервер
  use 'neovim/nvim-lspconfig'
  -- Иконки для автодополнения
  use {
    'onsails/lspkind-nvim',
  }

end)

