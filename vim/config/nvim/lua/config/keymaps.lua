local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- -- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>:bp<bar>sp<bar>bn<bar>bd<cr>", { desc = "Delete Buffer" })
-- map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- https://github.com/akinsho/bufferline.nvim/blob/99337f63f0a3c3ab9519f3d1da7618ca4f91cffe/lua/bufferline.lua#L157
map("n", "]t", "<cmd>BufferLineMoveNext<cr>", { desc = "Reorder tab next"})
map("n", "[t", "<cmd>BufferLineMovePrev<cr>", { desc = "Reorder tab back"})
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Reorder tab back"})
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Reorder tab back"})
