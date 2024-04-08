local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Подсветка при копировании на y
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = '200' })
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.fn.feedkeys("zz")
    end
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir", { clear = true } ),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Отключить автокомментирование новых строк
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Автоматическое переключение раскладки в нормальном режиме

local function check_dbus()
  local ret = os.execute('qdbus --version 2>&1 > /dev/null')                                        
  if ret == 0 then
    return true
  else
    return false
  end
end


local has_dbus = check_dbus()
-- Число зависит от настроек KDE
local ENGLISH_LANGUAGE = 0


local function set_current_language(language)
    if language ~= nil then
      os.execute(string.format(
        'qdbus org.kde.keyboard /Layouts setLayout %d > /dev/null', language))
    end
end


autocmd('InsertLeave', {
  callback = function()
    if has_dbus then
      set_current_language(ENGLISH_LANGUAGE)
    end
  end
})

