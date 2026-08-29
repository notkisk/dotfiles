-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {desc = "Next buffer"})
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", {desc = "Previous buffer"})
vim.keymap.set("n", "<C-Tab>", "<C-w>w", { desc = "Next window" })
vim.keymap.set("n", "<C-S-Tab>", "<C-w>W", { desc = "Previous window" })
vim.keymap.set("n", "H", "^", { desc = "Beginning of line" })
vim.keymap.set("n", "L", "$", { desc = "End of line" })
vim.keymap.set("n", "w", "b", { desc = "Previous word" })
vim.keymap.set("n", "b", "w", { desc = "Next word" })
