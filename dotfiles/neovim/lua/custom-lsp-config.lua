vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
        { noremap = true, desc = "Code action" })
vim.api.nvim_set_keymap("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>", { noremap = true, desc = "Code lens" })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>",
        { noremap = true, desc = "Show buffer diagnostics" })


vim.lsp.enable("python")
vim.lsp.enable("lua_ls")
vim.lsp.enable("nil_ls")
