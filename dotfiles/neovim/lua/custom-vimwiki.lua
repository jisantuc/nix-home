-- add a binding for generating table of contents
vim.api.nvim_set_keymap("n", "<leader>wc", "<cmd>VimwikiTOC<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wb", "<cmd>VimwikiBacklinks<CR>", { noremap = true })
