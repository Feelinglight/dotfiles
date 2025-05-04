return {
  "folke/tokyonight.nvim",
  opts = {
    style = "moon",
    on_highlights = function(hl, c)
      hl.GitSignsChange = { fg = "#b89554" }
      -- hl.DiagnosticInfo устанавливается для брейкпоинтов, потому что
      -- hl.debugBreakpoint не работает
      hl.DiagnosticInfo = { fg = "#d44855" }
    end,
  },
}
