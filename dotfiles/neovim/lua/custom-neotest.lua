vim.api.nvim_set_keymap("n", "<leader>tr",
        "<cmd>lua require('neotest').run.run()<CR>",
        { noremap = true, desc = "Run nearest test" })
vim.api.nvim_set_keymap("n", "<leader>tt",
        "<cmd>lua require('neotest').run.run_last()<CR>",
        { noremap = true, desc = "Re-run last test" })
vim.api.nvim_set_keymap("n", "<leader>tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
        { noremap = true, desc = "Run all tests in file" })
vim.api.nvim_set_keymap("n", "<leader>to",
        "<cmd>lua require('neotest').output.open({enter=true, last_run=true})<CR>",
        { noremap = true, desc = "Open last test output" })
