return {
  "kkoomen/vim-doge",
  build = ":call doge#install()",
  event = "BufRead",
  config = function()
    vim.g.doge_enable_mappings = 0

    vim.g.doge_doc_standard_cpp = "doxygen_cpp_comment_slash"
    vim.g.doge_doxygen_settings = {
      char = "\\",
    }

    vim.g.doge_doc_standard_python = "reST"
    vim.g.doge_python_settings = {
      single_quotes = 0,
      omit_redundant_param_types = 1,
    }
  end,
  keys = {
    { "<leader>cn", "<Plug>(doge-generate)", desc = "Generate documentation" },
  },
}
