return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      diagnostics = { -- Configure symbols mode
        win = {
          type = "split", -- split window
          relative = "win", -- relative to current window
          -- position = "right", -- right side
          -- size = 0.35, -- 30% of the window
          wo = {
            wrap = true,
          },
        },
      },
    },
  },
}
