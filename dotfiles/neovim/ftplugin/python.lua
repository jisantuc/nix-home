-- add special way to run black, since pyright doesn't have a code format option
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>!black %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cta", ":TestSuite<CR>", { noremap = true, desc = "Run all detected tests" })
vim.api.nvim_set_keymap("n", "<leader>ctf", ":TestFile<CR>", { noremap = true, desc = "Run tests in this file" })
vim.api.nvim_set_keymap("n", "<leader>ctl", ":TestLast<CR>", { noremap = true, desc = "Rerun the last run test" })
vim.api.nvim_set_keymap("n", "<leader>ctt", ":TestNearest<CR>", { noremap = true, desc = "Run nearest test to cursor" })

-- configure nvim-test
-- python only for now, which is why it's in ftplugin instead of somewhere more general
-- I'll move it if I end up using it often and borrowing it for other languages
require('nvim-test').setup {
        run = true,                     -- run tests (using for debug)
        commands_create = true,         -- create commands (TestFile, TestLast, ...)
        filename_modifier = ":.",       -- modify filenames before tests run(:h filename-modifiers)
        silent = false,                 -- less notifications
        term = "terminal",              -- a terminal to run ("terminal"|"toggleterm")
        termOpts = {
                direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
                width = 96,             -- terminal's width (for vertical|float)
                height = 24,            -- terminal's height (for horizontal|float)
                go_back = false,        -- return focus to original window after executing
                stopinsert = "auto",    -- exit from insert mode (true|false|"auto")
                keep_one = true,        -- keep only one terminal for testing
        },
        runners = {
                python = "nvim-test.runners.pytest",
        }
}
