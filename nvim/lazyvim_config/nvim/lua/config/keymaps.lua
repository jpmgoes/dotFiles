-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>wht", ":split | terminal<cr>a", { desc = "Open Horizontal Terminal" })
vim.keymap.set("n", "<leader>wvt", ":vsplit | terminal<cr>a", { desc = "Open Vertical Terminal" })

vim.keymap.set("n", "<leader><tab>t", function()
  vim.cmd("tabnew")
  vim.cmd("term")
end, { desc = "Open Terminal Tab" })

vim.api.nvim_set_keymap("i", "<C-f>", "<C-x><C-o>", {
  noremap = true,
  silent = true,
  desc = "Mostra sugestões",
})

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
