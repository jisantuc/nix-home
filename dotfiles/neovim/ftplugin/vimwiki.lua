-- list things that link to the currently opened wiki file
vim.api.nvim_set_keymap("n", "<leader>wlb", "<cmd>VimwikiBacklinks<CR>",
        { noremap = true, desc = "list backlinks" })
-- confirm all links in this wiki are reachable
vim.api.nvim_set_keymap("n", "<leader>wlc", "<cmd>VimwikiCheckLinks<CR>",
        { noremap = true, desc = "check links" })
-- generate a table of contents
vim.api.nvim_set_keymap("n", "<leader>wo", "<cmd>VimwikiTOC<CR>",
        { noremap = true, desc = "write table of contents" })

-- preview math
vim.api.nvim_set_keymap("n", "<leader>wmp", ":lua require('nabla').popup()<CR>",
        { noremap = true, desc = "popup equation preview" })
-- toggle math virtual lines
vim.api.nvim_set_keymap("n", "<leader>wmt", ":lua require('nabla').toggle_virt()<CR>",
        { noremap = true, desc = "toggle equation virtual lines" })
