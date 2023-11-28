-- add special way to run black, since pyright doesn't have a code format option
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>!black %<CR>", { noremap = true })

require("dap-python").setup("python")

require("dap-python").test_runner = "pytest"

vim.api.nvim_set_keymap("n",
        "<leader>cdb",
        "<cmd>lua require('dap').toggle_breakpoint()<CR>",
        { noremap = true })
vim.api.nvim_set_keymap("n",
        "<leader>cdc",
        "<cmd>lua require('dap').continue()<CR>",
        { noremap = true })
vim.api.nvim_set_keymap("n",
        "<leader>cdr",
        "<cmd>lua require('dap').repl.open()<CR>",
        { noremap = true })
vim.api.nvim_set_keymap("n",
        "<leader>cdtm",
        "<cmd>lua require('dap-python').test_method()<CR>",
        { noremap = true })
vim.api.nvim_set_keymap("n",
        "<leader>cdtc",
        "<cmd>lua require('dap-python').test_class()<CR>",
        { noremap = true })
