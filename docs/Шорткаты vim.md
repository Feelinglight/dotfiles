[Дефолтные комбинации клавиш](http://neovim.io/doc/user/quickref.html)

# Запуск

- ``nvim -u NONE`` - запуск без плагинов

# Файлы

# Режим вставки

- \<C-t\> - сдвинуть текст на одно выравнивание вправо
- \<C-d\> - сдвинуть текст на одно выравнивание влево
- \<C-O\> - перейти в нормальный режим для ввода одной команды. После ввода команды будет выполнен
  автоматический переход обратно в режим вставки
- \<C-r\>{register} - вставка из регистра
- \<C-v\>{code} - вставка unicode символа

# Text objects

- s - предложение

# Метки

- m{char} - установка метки char
- m{CHAR} - установка глобальной метки char
- delm! - удалить все локальные метки
- delm A-Z - удалить глобальные метки A-Z
- `{char} - переход к метке char
- '{char} - переход к строке с меткой char

## Автоматические метки

- `` - переход к месту перед последним переходом в текущем файле
- `. - переход к месту последнего изменения в текущем файле
- `^ - переход к месту последней вставки в текущем файле

# Регистры

- "{reg}{command} - выбор регистра перед выполнением команды
- " - неименованный регистр, в который не попадают строки из команд типа d,c
- 0 - регистр захвата, только для yank
- _ - blackhole, не попадают строки из любых команд
- = - калькулятор


# Перемещение по рабочей области

- \<C-y\> - сдвинуть экран вверх на 1 строку, без перемещения курсора
- \<C-e\> - сдвинуть экран вниз на 1 строку, без перемещения курсора
- g; - переход к следующему месту изменения
- g, - переход к предыдущему месту изменения
- gi - переход к последнему месту вставки с переходом в режим вставки

# Редактирование

# Поиск

# Поиск и замена

- :s/\<w1\>/\<w2\>/g - заменить **все** вхождения слова <w1> в текущей строке на <w2>
- :%s/\<w1\>/\<w2\>/g - заменить **все** вхождения слова <w1> во всем файле на <w2>
- :%s/\<w1\>/\<w2\>/gc - заменить **все** вхождения слова <w1> во всем файле на <w2>. Спрашивать о замене каждого слова

# Выделение

# Перемещение по тексту

# Редактирование кода

# Режим Ex

- ranges:

  - {start},{end} - задание диапазона
  - . - текущая строка
  - ^ - первая строка
  - $ - последняя строка
  - % - все строки
  - выделить текст и нажать ``:`` - диапазон строк выделенного текста

- :r !\<command\> - выполнить \<command\> и вставить ее вывод в место где расположен курсор
- :{range}norm <command> - применить действия нормального режима к диапазону строк
- @: - повтор последней команды ex
- q: - открыть окно истории ex
- \<C-f> из режима Ex - перейти в окно истории ex

## Исполнение shell команд

- read !{cmd} - прочитать stdout команды в буфер
- write !{cmd} - передать содержимое буфера на вход команде

# netrw

- :E - открыть netrw
- \<C-^> - переключиться между буфером и netrw

# Опции


# LazyVim

```lua
-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })

-- buffers
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Add undo break-points ???
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- LazyVim Changelog
map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

{ "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
{ "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },

-- search
{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Resume" },

