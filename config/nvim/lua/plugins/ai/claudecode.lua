return {
  "coder/claudecode.nvim",
  keys = {
    { "<leader>k", "", desc = "+ai", mode = { "n", "v" } },
    { "<leader>kc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>kr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>kC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>km", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>kb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>ks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>ks",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>ka", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>kd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
