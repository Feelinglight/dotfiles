-- return {
--   "williamboman/mason.nvim",
--   opts = {
--     -- Чтобы установленные линтеры/lsp не мешали виртуальным окружениям
--     PATH = "append",
--   },
-- }

-- workaround https://github.com/LazyVim/LazyVim/issues/6039
return {
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    opts = {
      -- Чтобы установленные линтеры/lsp не мешали виртуальным окружениям
      PATH = "append",
    },
  },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
