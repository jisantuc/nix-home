-- turn on line numbers, like we had in the old country
vim.wo.number = true
vim.wo.relativenumber = true

-- expand tabs
-- tabs are bad
-- 🔪
vim.opt.expandtab = true

-- make colors look nice
vim.opt.background = "light"
vim.cmd("colorscheme kanagawa")
