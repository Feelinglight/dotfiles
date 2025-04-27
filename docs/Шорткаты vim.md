[Дефолтные комбинации клавиш](http://neovim.io/doc/user/quickref.html)

# Файлы
- ZZ - сохранить и выйти

# Режим вставки
- \<C-t\> - сдвинуть текст на одно выравнивание вправо
- \<C-d\> - сдвинуть текст на одно выравнивание влево
- \<C-O\> - перейти в нормальный режим для ввода одной команды. После ввода команды будет выполнен
  автоматический переход обратно в режим вставки

# Перемещение рабочей области
- zz - центрировать окно по текущему положению курсора
- zt - расположить окно так, чтобы курсор оказался на верхней строке
- zb - расположить окно так, чтобы курсор оказался на нижней строке
- \<C-y\> - сдвинуть экран вверх на 1 строку, без перемещения курсора
- \<C-e\> - сдвинуть экран вниз на 1 строку, без перемещения курсора

# Редактирование
- . - повторить предыдущие действие
- J (Join) - объединить текущую и следующую строки и установить курсор на место объединения
- ciw (change inner word) - изменить слово под курсором
- ciW - изменить слово под курсором, включая символы типа :,* и т. д.
- c\<N\>l - изменить N символов под курсором
- cf\<char\> - изменить строку от курсора до следующего <char> (включая <char>)
- S - изменить целую строку
- == - исправить выравнивание текущей строки
- \<N\>== - исправить выравнивание \<N\> строк ниже
- gg=G - исправить выравнивание во всем файле
- cs\<char1\>\<char2\> - находясь внутри окруженного кавычками текста заменить символ кавычек с **char1** на **char2**
- [Другие операции с кавычками](https://github.com/tpope/vim-surround)

# Мультиедит

Выполнить последовательность:

- \<C-v\> - перейти в режим блочного выделения.
- Выделить нужные строки с помощью hjkl
- \<S-I\> - перейти в режим multiedit вставки

> В некоторых редакторах (в том числе nvim) режим multiedit вставки не отображается графически,
> а выглядит как вставка в одну строку. Но после вставки текста и нажатия \<Esc\>, введенные
> символы вставляются во все выделенные до этого строки

# Поиск
- \* - поиск вперед слова под курсором
- \# - поиск назад слова под курсором
- g* - поиск вперед слова под курсором с частичными совпадениями
- g# - поиск вперед слова под курсором с частичными совпадениями

# Поиск и замена

- :s/\<w1\>/\<w2\> - заменить **первое** вхождение слова <w1> в текущей строке на <w2>
- :s/\<w1\>/\<w2\>/g - заменить **все** вхождения слова <w1> в текущей строке на <w2>
- :%s/\<w1\>/\<w2\>/g - заменить **все** вхождения слова <w1> во всем файле на <w2>
- :%s/\<w1\>/\<w2\>/gc - заменить **все** вхождения слова <w1> во всем файле на <w2>. Спрашивать о замене каждого слова

# Выделение
- viw - выделить слово под курсором
- viW - выделить слово под курсором, включая символы типа :,* и т. д.

# Перемещение по тексту
- f\<char\> - перенести курсор на слерующий \<char\>
- gj - переместить курсор на визуальную строку ниже
- gk - переместить курсор на визуальную строку выше
- gd - перейти к определению
- \<S\>T - перейти обратно после перехода к определению
- gg - переместить курсор на первую строку в файле
- \<S\>G - переместить курсор на последнюю строку в файле

# Редактирование кода
- \<S\>\<\< - сдвинуть строку на одно выравнивание влево
- \<S\>\>\> - сдвинуть строку на одно выравнивание вправо
- gcc - закомментировать строку
- gbc - закомментировать строку двойным комментарием

# Консоль

- :!\<command\> - выполнить команду в терминале и показать ее вывод
- :r FILENAME - вставить содержимое файла FILENAME в место где расположен курсор
- :r !\<command\> - выполнить \<command\> и вставить ее вывод в место где расположен курсор

# Опции

- :set ic (noic) - включить (выключить) игнорирование регистра при поиске

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

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Snacks
if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- LazyVim Changelog
map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- terminal
map("n", "<c-/>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

{ "<BS>", desc = "Decrement Selection", mode = "x" },
{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },

{ "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References", nowait = true },
{ "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
{ "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },

-- search
{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Resume" },
```

