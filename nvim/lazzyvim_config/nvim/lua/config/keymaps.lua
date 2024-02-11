-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>wht", ":split | terminal<cr>a", { desc = "[O]pen [H]orizontal [T]erminal" })
vim.keymap.set("n", "<leader>wvt", ":vsplit | terminal<cr>a", { desc = "[O]pen [V]ertical [T]erminal" })
