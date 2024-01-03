-- use git blame to show blame in status line
local git_blame = require("gitblame")
vim.g.gitblame_enabled = 0

-- launch git status and git blame conveniently
vim.api.nvim_set_keymap("n", "<space>gg", "<cmd>:LazyGit<CR>", { noremap = true, desc = "Open LazyGit" })
vim.api.nvim_set_keymap("n", "<space>gb", "<cmd>:GitBlameToggle<CR>", { noremap = true, desc = "Toggle git blame" })

-- set custom config location for lazygit
vim.g.lazygit_use_custom_config_file_path = 1;
vim.g.lazygit_config_file_path = "$HOME/.config/lazygit/config.yml"
