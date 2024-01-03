-- list things that link to the currently opened wiki file
vim.api.nvim_set_keymap("n", "<leader>wlb", "<cmd>VimwikiBacklinks<CR>", { noremap = true, desc = "List backlinks" })
-- confirm all links in this wiki are reachable
vim.api.nvim_set_keymap("n", "<leader>wlc", "<cmd>VimwikiCheckLinks<CR>", { noremap = true, desc = "Check all links" })
-- generate a table of contents
vim.api.nvim_set_keymap("n", "<leader>wo", "<cmd>VimwikiTOC<CR>",
        { noremap = true, desc = "Insert or update table of contents" })
