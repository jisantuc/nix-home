-- keymappings

local restNvim = require('rest-nvim')

local function selectEnv(envFile)
        restNvim.select_env(envFile)
end

vim.api.nvim_create_user_command(
        "HttpSelectEnv",
        function(opts) selectEnv(opts.fargs[1] .. ".env") end,
        { nargs = 1 }
)

-- -- run the command in this file
vim.api.nvim_set_keymap("n", "<leader>hel", "<cmd>:HttpSelectEnv local<CR>",
        { noremap = true, desc = "Use local .env file for rest-nvim" })
vim.api.nvim_set_keymap("n", "<leader>het", "<cmd>:HttpSelectEnv test<CR>",
        { noremap = true, desc = "Use test .env file for rest-nvim" })
vim.api.nvim_set_keymap("n", "<leader>hep", "<cmd>:HttpSelectEnv prod<CR>",
        { noremap = true, desc = "Use prod .env file for rest-nvim" })
vim.api.nvim_set_keymap("n", "<leader>hs", ":lua require('rest-nvim').run()<CR>",
        { noremap = true, desc = "Send http request" })
