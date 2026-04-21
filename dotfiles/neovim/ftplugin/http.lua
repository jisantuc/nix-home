vim.api.nvim_set_keymap("n", "<leader>hs", "<cmd>:Rest run<CR>",
        { noremap = true, desc = "Send http request" })
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>DataDogTraceLogs<CR>",
        { noremap = true, desc = "Open DataDog logs for trace id under cursor" })
