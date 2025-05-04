return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      -- Перемещает курсор на строку ниже после комментирования строки
      post_hook = function(ctx)
        local u = require("Comment.utils")
        if ctx.ctype == u.ctype.linewise and ctx.range.srow == ctx.range.erow then
          vim.api.nvim_win_set_cursor(0, { ctx.range.srow + 1, vim.api.nvim_win_get_cursor(0)[2] })
        end
      end,
    })
  end,
}
