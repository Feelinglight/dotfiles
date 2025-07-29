return {
  -- Перед отменой переместить курсор на место отмены
  {
    "EtiamNullam/gradual-undo.nvim",
    enabled = false,
    config = function()
      require("gradual-undo").setup()
    end,
  },
}
