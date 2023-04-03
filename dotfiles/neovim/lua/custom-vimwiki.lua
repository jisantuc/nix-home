-- add a binding for generating table of contents
vim.api.nvim_set_keymap("n", "<leader>wlb", "<cmd>VimwikiBacklinks<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wlc", "<cmd>VimwikiCheckLinks<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wc", "<cmd>VimwikiTOC<CR>", { noremap = true })
