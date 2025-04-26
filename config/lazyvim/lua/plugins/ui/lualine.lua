local lint_progress = function()
  local linters = require("lint").get_running()
  if #linters == 0 then
    return "󰦕"
  end
  return "󱉶 " .. table.concat(linters, ", ")
end

return {

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, "filetype")
      table.insert(opts.sections.lualine_x, 1, "fileformat")
      table.insert(opts.sections.lualine_x, 1, "encoding")
      table.insert(opts.sections.lualine_x, 1, { lint_progress })
    end,
  },
}
