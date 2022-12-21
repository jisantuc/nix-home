-- use git blame to show blame in status line
local git_blame = require('gitblame')

-- launch git status and git blame conveniently
vim.api.nvim_set_keymap("n", "<space>gg", "<cmd>:LazyGit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gb", "<cmd>:GitBlameToggle<CR>", { noremap = true })
