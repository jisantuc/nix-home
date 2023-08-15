-- make find much better
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.bloop/*"
vim.opt.wildignore:append "**/target/*"
vim.opt.wildignore:append "**/.bsp/*"
vim.opt.wildignore:append "**/.metals/*"
vim.api.nvim_set_keymap("n", "<space>fb", "<cmd>:FzfLua buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>ff", "<cmd>:FzfLua files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>fg", "<cmd>:FzfLua git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>flds", "<cmd>:FzfLua lsp_document_symbols<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>flws", "<cmd>:FzfLua lsp_workspace_symbols<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>fs", "<cmd>:FzfLua grep_project<CR>", { noremap = true })

