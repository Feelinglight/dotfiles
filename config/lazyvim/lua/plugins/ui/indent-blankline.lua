return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "dashboard",
      },
    },
  },
  main = "ibl",
}
