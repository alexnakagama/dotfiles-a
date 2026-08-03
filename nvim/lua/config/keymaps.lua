-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local harpoon = require("harpoon")

-- Add file
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon add file" })

-- Toggle menu
vim.keymap.set("n", "<leader>m", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

-- Navigate files
vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon file 4" })

-- Remove current file
vim.keymap.set("n", "<leader>r", function()
  local list = harpoon:list()
  local item = list:get()

  if item then
    list:remove(item)
  end
end, { desc = "Remove from Harpoon" })

-- Clear all
vim.keymap.set("n", "<leader>R", function()
  harpoon:list():clear()
end, { desc = "Clear Harpoon" })
