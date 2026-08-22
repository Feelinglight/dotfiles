local keymaps = require("config.keymaps-const")
local gs = require("gitsigns")

return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          { "<leader>h", group = "hunks" },
        },
      },
    },
  },

  {
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
      {
        keymaps.NEXT_HUNK,
        -- "]h",
        "<cmd>Gitsigns next_hunk<cr>",
        desc = "Next Hunk",
      },
      {
        keymaps.PREV_HUNK,
        -- "[h",
        "<cmd>Gitsigns prev_hunk<cr>",
        desc = "Prev Hunk",
      },

      { "<leader>hs", gs.stage_hunk, mode = { "n", "x" }, desc = "Stage Hunk" },
      { "<leader>hr", gs.reset_hunk, mode = { "n", "x" }, desc = "Reset Hunk" },

      { "<leader>hS", gs.stage_buffer, mode = { "n" }, desc = "Stage Buffer" },
      { "<leader>hu", gs.undo_stage_hunk, mode = { "n" }, desc = "Undo Stage Hunk" },
      { "<leader>hR", gs.reset_buffer, mode = { "n" }, desc = "Reset Buffer" },
      { "<leader>hp", gs.preview_hunk_inline, mode = { "n" }, desc = "Preview Hunk Inline" },

      { "<leader>hd", gs.diffthis, mode = { "n" }, desc = "Diff This" },
      {
        "<leader>hD",
        function()
          gs.diffthis("~")
        end,
        mode = { "n" },
        desc = "Diff This ~",
      },
      {
        "<leader>hb",
        function()
          gs.blame_line({ full = true })
        end,
        mode = { "n" },
        desc = "Blame Line",
      },
      {
        "<leader>hB",
        function()
          gs.blame()
        end,
        mode = { "n" },
        desc = "Blame Buffer",
      },
    },
  },
}
