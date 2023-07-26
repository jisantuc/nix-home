-- list things that link to the currently opened wiki file
vim.api.nvim_set_keymap("n", "<leader>wlb", "<cmd>VimwikiBacklinks<CR>", { noremap = true })
-- confirm all links in this wiki are reachable
vim.api.nvim_set_keymap("n", "<leader>wlc", "<cmd>VimwikiCheckLinks<CR>", { noremap = true })
-- generate a table of contents
vim.api.nvim_set_keymap("n", "<leader>wc", "<cmd>VimwikiTOC<CR>", { noremap = true })
-- open local wiki index file -- "wiki here"
-- this is a workaround for lack of discovery in vimwiki and my personal desire not to write
-- absolute paths into my registered wikis
-- the opened wiki will be a "temporary wiki" (see `:h vimwiki-temporary-wiki`) but that's ok,
-- everything will still work within the nvim session
vim.api.nvim_set_keymap("n", "<leader>w.", "<cmd>:e .wiki/index.wiki<CR>", { noremap = true })
