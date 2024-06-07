-- use git blame to show blame in status line
vim.g.gitblame_enabled = 0

-- launch git status and git blame conveniently
vim.api.nvim_set_keymap("n", "<space>gg", "<cmd>:LazyGit<CR>", { noremap = true, desc = "Open LazyGit" })
vim.api.nvim_set_keymap("n", "<space>gb", "<cmd>:GitBlameToggle<CR>", { noremap = true, desc = "Toggle git blame" })
