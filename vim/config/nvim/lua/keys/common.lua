require('keys/alias')

-- Стрелочки откл. Использовать hjkl
nmap('<up>', ':echoe "Use k"<CR>', {silent = false})
nmap('<down>', ':echoe "Use j"<CR>', {silent = false})
nmap('<left>', ':echoe "Use h"<CR>', {silent = false})
nmap('<right>', ':echoe "Use l"<CR>', {silent = false})

-- Назначает дополнительной клавишей для отключения режима Ctrl + K
imap('<C-k>', '<Esc>')

-- Сохранение по Ctrl + S
nmap('<C-s>', ':w<CR>')
imap('<C-s>', '<Esc>:w<CR>a')


