require("which-key").setup {}

-- add a binding to open the interactive which-key popup
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>WhichKey<CR>", { noremap = true, desc = "Open whichkey prompt" })
