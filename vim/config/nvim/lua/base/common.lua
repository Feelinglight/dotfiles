local opt = vim.opt
-- глобальные настройки
local g = vim.g

-- используем системный буфер обмена
opt.clipboard = 'unnamedplus'


--[[ Поиск ]]--
-- Игнорировать регистр при поиске
-- Если теперь введем "IGNORE", то он найдет и "ignore"
opt.ignorecase = true

-- Не игнорировать регистр, если есть символы в верхнем регистре
-- Если напишем "Ignore", то он будет искать только "Ignore"
opt.smartcase = true

-- Подсвечивать найденные текстовые объекты
opt.showmatch = true

