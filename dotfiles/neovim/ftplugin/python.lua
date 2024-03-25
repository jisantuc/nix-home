-- add special way to run black, since pyright doesn't have a code format option
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>!black %<CR>", { noremap = true, desc = "Run black on buffer" })

local dap_python = require("dap-python")

dap_python.setup("python")
dap_python.test_runner = "pytest_no_cov"
function dap_python.test_runners.pytest_no_cov(classname, methodname)
        local test_module, test_args = dap_python.test_runners.pytest(classname, methodname)
        test_args[#test_args + 1] = "--no-cov"
        return test_module, test_args
end

vim.api.nvim_set_keymap("n",
        "<leader>cdb",
        "<cmd>lua require('dap').toggle_breakpoint()<CR>",
        { noremap = true, desc = "Toggle breakpoint" })
vim.api.nvim_set_keymap("n",
        "<leader>cdc",
        "<cmd>lua require('dap').continue()<CR>",
        { noremap = true, desc = "Continue debug run" })
vim.api.nvim_set_keymap("n",
        "<leader>cdr",
        "<cmd>lua require('dap').repl.open()<CR>",
        { noremap = true, desc = "Open debug repl" })
vim.api.nvim_set_keymap("n",
        "<leader>cdtm",
        "<cmd>lua require('dap-python').test_method()<CR>",
        { noremap = true, desc = "Test method" })
vim.api.nvim_set_keymap("n",
        "<leader>cdtc",
        "<cmd>lua require('dap-python').test_class()<CR>",
        { noremap = true, desc = "Test class" })
