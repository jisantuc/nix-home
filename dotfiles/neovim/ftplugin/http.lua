-- keymappings
-- -- run the command in this file
vim.api.nvim_set_keymap("n", "<leader>hs", "<Plug>RestNvim<CR>", { noremap = true })
-- preview the curl command
vim.api.nvim_set_keymap("n", "<leader>hp", "<Plug>RestNvimPreview<CR>", { noremap = true })
-- rerun last command
vim.api.nvim_set_keymap("n", "<leader>hr", "<Plug>RestNvimLast<CR>", { noremap = true })

