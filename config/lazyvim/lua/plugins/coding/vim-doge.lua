return {
  "kkoomen/vim-doge",
  build = ":call doge#install()",
  event = "BufRead",
  config = function()
    vim.g.doge_enable_mappings = 0
    vim.g.doge_doc_standard_python = "reST"
    vim.g.doge_python_settings = {
      single_quotes = 0,
      omit_redundant_param_types = 1,
    }
  end,
  keys = {
    { "<leader>d", "<Plug>(doge-generate)", desc = "Generate documentation" },
  },
}
