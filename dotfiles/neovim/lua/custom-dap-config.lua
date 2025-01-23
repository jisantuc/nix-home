require("nvim-dap-virtual-text").setup()

require("dapui").setup()

vim.api.nvim_set_keymap("n",
        "<leader>cdu",
        "<cmd>lua require('dapui').toggle()<CR>",
        { noremap = true, desc = "Toggle debug adapter UI" })
