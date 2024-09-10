local dap = require("dap")

vim.opt.colorcolumn = "120"

require("neotest").setup {
        adapters = {
                require("neotest-haskell") {
                        -- Default: Use stack if possible and then try cabal
                        build_tools = { "cabal" },
                        -- Default: Check for tasty first and then try hspec
                        frameworks = { "hspec", "tasty", "sydtest" },
                },
        },
}

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
vim.api.nvim_set_keymap("n", "<leader>tn",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
        { noremap = true, desc = "Debug nearest test" })

dap.adapters.haskell = {
        type = 'executable',
        command = 'haskell-debug-adapter',
        args = { '--hackage-version=0.0.33.0' },
}
dap.configurations.haskell = {
        {
                type = 'haskell',
                request = 'launch',
                name = 'Debug',
                workspace = '${workspaceFolder}',
                startup = "${file}",
                stopOnEntry = true,
                logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
                logLevel = 'WARNING',
                ghciEnv = vim.empty_dict(),
                ghciPrompt = "ghci> ",
                -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
                ghciInitialPrompt = "ghci> ",
                ghciCmd = "cabal repl --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
        },
}
