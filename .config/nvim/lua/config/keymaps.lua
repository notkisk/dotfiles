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

-- Replace group
vim.keymap.set("n", "<leader>r", "<Nop>", { desc = "+Replace" })

-- Replace word under cursor in current file
vim.keymap.set("n", "<leader>rw", function()
  local word = vim.fn.expand("<cword>")
  local replacement = vim.fn.input("Replace '" .. word .. "' with: ")

  if replacement ~= "" then
    vim.cmd("%s/\\V" .. vim.fn.escape(word, "/") .. "/" ..
      vim.fn.escape(replacement, "/") .. "/g")
  end
end, { desc = "Word → current file" })

-- Replace word under cursor across project
vim.keymap.set("n", "<leader>rW", function()
  local word = vim.fn.expand("<cword>")
  local replacement = vim.fn.input("Replace '" .. word .. "' with: ")

  if replacement ~= "" then
    vim.cmd("silent! grep -R -l --exclude-dir=.git " ..
      vim.fn.shellescape(word) .. " . | xargs sed -i 's/" ..
      vim.fn.escape(word, "\\/") .. "/" ..
      vim.fn.escape(replacement, "\\/") .. "/g'")
  end
end, { desc = "Word → whole project" })

-- Search and replace in current file
vim.keymap.set("n", "<leader>rs", function()
  local search = vim.fn.input("Search: ")

  if search == "" then
    return
  end

  -- Highlight all occurrences
  vim.fn.setreg("/", search)
  vim.cmd("set hlsearch")

  local replacement = vim.fn.input("Replace with: ")

  vim.cmd("%s/\\V" .. vim.fn.escape(search, "/") .. "/" ..
    vim.fn.escape(replacement, "/") .. "/g")
end, { desc = "Search → current file" })

-- Search and replace across project
vim.keymap.set("n", "<leader>rS", function()
  local search = vim.fn.input("Search: ")

  if search == "" then
    return
  end

  -- Highlight the search term
  vim.fn.setreg("/", search)
  vim.cmd("set hlsearch")

  local replacement = vim.fn.input("Replace with: ")

  if replacement ~= "" then
    vim.cmd("silent! grep -R -l --exclude-dir=.git " ..
      vim.fn.shellescape(search) .. " . | xargs sed -i 's/" ..
      vim.fn.escape(search, "\\/") .. "/" ..
      vim.fn.escape(replacement, "\\/") .. "/g'")
  end
end, { desc = "Search → whole project" })
