local prettier_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  html = true,
}

return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    for ft, formatters in pairs(opts.formatters_by_ft) do
      if not prettier_filetypes[ft] then
        opts.formatters_by_ft[ft] = vim.tbl_filter(function(formatter)
          return formatter ~= "prettier"
        end, formatters)
      end
    end
  end,
}
