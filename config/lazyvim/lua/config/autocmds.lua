-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

------------------- custom -------------------

-- Отключение автоматических комментов при переходе на новую строку
vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})

-- -- Открыть Neo-tree при запуске neovim
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = augroup("neotree", { clear = true }),
--   desc = "Open Neotree on startup",
--   callback = function()
--     -- Если nvim открыт без аргументов, то будет открыт dashboard. Там neo-tree не показываем
--     if vim.api.nvim_cmd({ cmd = "args" }, { output = true }) == "" then
--       return
--     end
--     -- Без задержки валятся ошибки при открытии файлов
--     vim.defer_fn(function()
--       vim.cmd("Neotree show")
--     end, 100)
--   end,
-- })

-- Автоматическое переключение раскладки в нормальном режиме
local function check_dbus()
  local ret = os.execute("qdbus --version > /dev/null 2>&1")
  if ret == 0 then
    return true
  else
    return false
  end
end

local has_dbus = check_dbus()
-- Число зависит от настроек KDE, обычно 0
local ENGLISH_LANGUAGE = 0

local function set_current_language(language)
  os.execute(string.format("qdbus org.kde.keyboard /Layouts setLayout %d > /dev/null", language))
end

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if has_dbus then
      set_current_language(ENGLISH_LANGUAGE)
    end
  end,
})
