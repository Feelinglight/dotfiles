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
  command = "set formatoptions-=t | set formatoptions-=c | set formatoptions-=r | set formatoptions-=o",
})

-- Открыть Neo-tree при запуске neovim
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("neotree", { clear = true }),
  desc = "Open Neotree on startup",
  callback = function()
    -- Если nvim открыт без аргументов, то будет открыт dashboard. Там neo-tree не показываем
    if vim.api.nvim_cmd({ cmd = "args" }, { output = true }) == "" then
      return
    end
    -- Без задержки валятся ошибки при открытии файлов
    vim.defer_fn(function()
      vim.cmd("Neotree show")
    end, 100)
  end,
})

-- Автоматическое переключение раскладки в нормальном режиме
local function get_qdbus_util()
  local check_command = "%s --version > /dev/null 2>&1"
  if os.execute(string.format(check_command, "qdbus6")) == 0 then
    return "qdbus6"
  elseif os.execute(string.format(check_command, "qdbus")) == 0 then
    return "qdbus"
  else
    return ""
  end
end

-- Число зависит от настроек KDE, обычно 0
local ENGLISH_LANGUAGE = 0
local qdbus_util = get_qdbus_util()

local function set_current_language(language, qdbus_name)
  os.execute(
    string.format("%s org.kde.keyboard /Layouts setLayout %d > /dev/null", qdbus_name, language)
  )
end

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if qdbus_util ~= "" then
      set_current_language(ENGLISH_LANGUAGE, qdbus_util)
    end
  end,
})
