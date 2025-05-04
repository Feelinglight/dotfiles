return {
  "ntpeters/vim-better-whitespace",
  event = "BufEnter",
  config = function()
    vim.g.better_whitespace_enabled = 1
    vim.g.strip_whitespace_on_save = 0
    vim.g.strip_whitespace_confirm = 0
    vim.g.better_whitespace_guicolor = "#8f5151"
    vim.g.current_line_whitespace_disabled_soft = 1
    vim.g.better_whitespace_filetypes_blacklist = { "dashboard", "snacks_dashboard" }

    local strip_enabled = true
    Snacks.toggle
      .new({
        id = "strip_whitespace_on_save",
        name = "Strip Whitespaces On Save",
        get = function()
          return strip_enabled
        end,
        set = function()
          vim.cmd("ToggleWhitespace")
          strip_enabled = not strip_enabled
        end,
      })
      :map("<Space>u<Space>")

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        if strip_enabled then
          local strip_range = 2000

          local current_row = vim.fn.getpos(".")[2]

          local first_line = math.max(0, current_row - strip_range)
          local last_line = math.min(current_row + strip_range, vim.fn.line("$"))

          vim.cmd(string.format("%s,%sStripWhitespace", first_line, last_line))
        end
      end,
    })
  end,
}
