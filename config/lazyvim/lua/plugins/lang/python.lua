-- Копия линтера mypy, но убирает подчеркивание всего тела функции, подчеркивается только первая
-- строка сигнатуры
local function pretty_mypy_linter()
  local pattern = "([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.*) %[(%a[%a-]+)%]"
  local groups = { "file", "lnum", "col", "end_lnum", "end_col", "severity", "message", "code" }
  local severities = {
    error = vim.diagnostic.severity.ERROR,
    warning = vim.diagnostic.severity.WARN,
    note = vim.diagnostic.severity.HINT,
  }

  return {
    cmd = "mypy",
    stdin = false,
    stream = "both",
    ignore_exitcode = true,
    args = {
      -- "--strict",
      "--show-column-numbers",
      "--show-error-end",
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
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "pyright",
          "mypy",
          "ruff",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    enable = false,
    opts = {
      servers = {
        pyright = {
          enabled = false,
        },
        ruff = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "pretty_mypy" },
      },
      linters = {
        pretty_mypy = pretty_mypy_linter(),
      },
    },
  },

  {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
          },
        },
      },
    },
  },
}
