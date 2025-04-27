if true then
  return {}
end

-- Копия линтера mypy, но всегда включает режим strict
-- Также убирает подчеркивание всего тела функции, подчеркивается только первая строка сигнатуры
local function pretty_mypy_linter()
  local pattern = "([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.*)"
  local groups = { "file", "lnum", "col", "end_lnum", "end_col", "severity", "message" }
  local severities = {
    error = vim.diagnostic.severity.ERROR,
    warning = vim.diagnostic.severity.WARN,
    note = vim.diagnostic.severity.HINT,
  }

  return {
    cmd = "mypy",
    stdin = false,
    ignore_exitcode = true,
    args = {
      "--strict",
      "--show-column-numbers",
      "--show-error-end",
      "--hide-error-codes",
      "--hide-error-context",
      "--no-color-output",
      "--no-error-summary",
      "--no-pretty",
    },
    parser = function(output, bufnr, linter_cwd)
      local current_groups = { table.unpack(groups) }
      -- Если будут другие проблемы с подсветкой, то добавлять их сюда
      if output:find("Function") ~= nil then
        -- Если убрать правильное имя из groups, то подчеркиваться будет одна строка
        current_groups[4] = ""
      end
      return require("lint.parser").from_pattern(
        pattern,
        current_groups,
        severities,
        { ["source"] = "mypy" },
        { end_col_offset = 0 }
      )(output, bufnr, linter_cwd)
    end,
  }
end

return {
  {
    "mfussenegger/nvim-lint",
    lazy = false,
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        -- Все линтеры должны быть установлены через mason в lsp.lua, либо вручную, если в
        -- Mason их установка не поддерживается!!!
        python = { "pretty_mypy", "ruff" },
        cpp = { "clangtidy" },
        yaml = { "yamllint" },
        cmake = { "cmakelint" },
        sh = { "shellcheck" },
      },
      linters = {
        pretty_mypy = pretty_mypy_linter(),
      },
    },
  },
}
