return {
  "gbprod/yanky.nvim",
  -- Завешивает neovim, поэтому выключен. Может когда-нибудь исправят
  -- Как проверить: включить плагин -> открыть любой файл -> заблокировать экран -> разблокировать
  --  экран -> neovim завис
  -- Похожее issue: https://github.com/gbprod/yanky.nvim/issues/37
  enabled = false,
  opts = {
    highlight = { timer = 150 },
    system_clipboard = {
      sync_with_ring = true,
    },
  },
  keys = function()
    return {
      {
        "<leader>p",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },

      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },

      { "<C-p>", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
      { "<C-y>", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
    }
  end,
}
