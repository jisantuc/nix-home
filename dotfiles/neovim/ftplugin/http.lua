-- run the command in this file
vim.api.nvim_set_keymap("n", "<leader>hel", "<cmd>:Rest env set local.env<CR>",
        { noremap = true, desc = "Use local .env file for rest-nvim" })
vim.api.nvim_set_keymap("n", "<leader>het", "<cmd>:Rest env set test.env<CR>",
        { noremap = true, desc = "Use test .env file for rest-nvim" })
vim.api.nvim_set_keymap("n", "<leader>hep", "<cmd>:Rest env set prod.env<CR>",
        { noremap = true, desc = "Use prod .env file for rest-nvim" })
vim.api.nvim_set_keymap("n", "<leader>hs", "<cmd>:Rest run<CR>",
        { noremap = true, desc = "Send http request" })
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>DataDogTraceLogs<CR>",
        { noremap = true, desc = "Open DataDog logs for trace id under cursor" })
