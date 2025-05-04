return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
    },
  },
  keys = {
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick tab" },
  },
}
