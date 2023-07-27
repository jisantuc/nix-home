-- add special way to run black, since pyright doesn't have a code format option
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>!black %<CR>", { noremap = true })
