return {
  "lewis6991/gitsigns.nvim",
  -- lazy = false,
  opts = {
    signs = {
      -- https://symbl.cc/ru/unicode/blocks/block-elements/
      add = { text = "▋" },
      change = { text = "▋" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▋" },
      untracked = { text = "▋" },
    },
    signs_staged = {
      add = { text = "▋" },
      change = { text = "▋" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▋" },
    },
  },
  keys = {
    { "]g", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
    { "[g", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
    -- { "]g", "]h", desc = "Next hunk", remap = true },
    -- { "[g", "[h", desc = "Prev huhk", remap = true },
  },
}
