-- launch git status buffer conveniently
vim.api.nvim_set_keymap("n", "<space>gg", "<cmd>:LazyGit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gf", "<cmd>:LazyGitCurrentFile<CR>", { noremap = true })
