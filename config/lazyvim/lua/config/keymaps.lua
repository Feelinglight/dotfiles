-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead

local map = vim.keymap.set

-- deleted

-- vim.keymap.del()

--- changed

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  -- vim.cmd("noh") <--- Убрано
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape snippet" })

map("n", "<leader><tab><tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

--- custom
