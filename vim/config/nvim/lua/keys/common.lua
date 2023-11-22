require('keys/alias')

-- Назначает дополнительной клавишей для отключения режима Ctrl + K
imap('<C-k>', '<Esc>')

-- Сохранение по Ctrl + S
nmap('<C-s>', ':w<CR>')
imap('<C-s>', '<Esc>:w<CR>a')


