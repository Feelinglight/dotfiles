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

-- По умолчанию Tab вставляет пробелы
opt.expandtab = true
-- На Tab вставляется 2 пробела
opt.shiftwidth = 2
-- Табы в файлах отображаются по 4 символа
opt.tabstop = 4

