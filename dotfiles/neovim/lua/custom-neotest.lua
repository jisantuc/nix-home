vim.api.nvim_set_keymap("n", "<leader>tr",
        "<cmd>lua require('neotest').run.run()<CR>",
        { noremap = true, desc = "Run nearest test" })
vim.api.nvim_set_keymap("n", "<leader>tt",
        "<cmd>lua require('neotest').run.run_last()<CR>",
        { noremap = true, desc = "Re-run last test" })
vim.api.nvim_set_keymap("n", "<leader>tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
        { noremap = true, desc = "Run all tests in file" })
vim.api.nvim_set_keymap("n", "<leader>tot",
        "<cmd>lua require('neotest').output_panel.toggle()<CR>",
        { noremap = true, desc = "Toggle test output pane" })
vim.api.nvim_set_keymap("n", "<leader>toc",
        "<cmd>lua require('neotest').output_panel.clear()<CR>",
        { noremap = true, desc = "Clear test output pane" })
vim.api.nvim_set_keymap("n", "<leader>ts",
        "<cmd>lua require('neotest').summary.toggle()<CR>",
        { noremap = true, desc = "Toggle test summary pane" })
