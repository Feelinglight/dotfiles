
if true then return {
} 
end

return require('packer').startup(function(use)
  -- Отображение отступов
  use 'lukas-reineke/indent-blankline.nvim'
  -- Иконки для автодополнения
  use {
    'onsails/lspkind-nvim',
  }

end)

