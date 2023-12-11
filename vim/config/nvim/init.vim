" -------------------- Settings --------------------
 
" Используем системный буфер обмена
set clipboard^=unnamed,unnamedplus


" ------ [[ Search ]] ------
  
" Игнорировать регистр при поиске
" Если теперь введем "IGNORE", то он найдет и "ignore"
set ignorecase

" Не игнорировать регистр, если есть символы в верхнем регистре
" Если напишем "Ignore", то он будет искать только "Ignore"
set smartcase

" Подсвечивать найденные текстовые объекты
set showmatch


" ------ [[ Indent ]] ------

" По умолчанию Tab вставляет пробелы
set expandtab

" На Tab вставляется 2 пробела
set shiftwidth=2

" Табы в файлах отображаются по 4 символа
set tabstop=4


" ------ [[ View ]] ------

" Отображать номера строк
set number

" Подсвечивать текущую строку
set cursorline

" Отображать табы как >~~~
set list
set listchars=tab:>~

" -------------------- Keybindings --------------------

" Выход из режима вставки по Ctrl+k
imap <C-k> <Esc>

" Сохранение на Ctrl+S
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i


" -------------------- Load lua config --------------------
lua require('init')

