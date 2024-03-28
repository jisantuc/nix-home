local fzfLua = require("fzf-lua")

-- make find much better
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.bloop/*"
vim.opt.wildignore:append "**/target/*"
vim.opt.wildignore:append "**/.bsp/*"
vim.opt.wildignore:append "**/.metals/*"
vim.api.nvim_set_keymap("n", "<space>fb", "<cmd>:FzfLua buffers<CR>", { noremap = true, desc = "Choose open buffer" })
vim.api.nvim_set_keymap("n", "<space>fl", "<cmd>:FzfLua lines<CR>", { noremap = true, desc = "Choose file in workspace" })
vim.api.nvim_set_keymap("n", "<space>ff", "<cmd>:FzfLua files<CR>", { noremap = true, desc = "Choose file in workspace" })
vim.api.nvim_set_keymap("n", "<space>fg", "<cmd>:FzfLua git_files<CR>", { noremap = true, desc = "Choose git file" })
vim.api.nvim_set_keymap("n", "<space>fs", "<cmd>:FzfLua grep_project<CR>",
        { noremap = true, desc = "Search string in project" })
vim.api.nvim_set_keymap("n", "<space>fls", "<cmd>:FzfLua grep_last<CR>",
        { noremap = true, desc = "Repeat last search" })
vim.api.nvim_set_keymap("n", "<space>fws", ":lua require('fzf-lua').live_grep({cwd='~/vimwiki'})<CR>",
        { noremap = true, desc = "Search in vimwiki" })
vim.api.nvim_set_keymap("n", "<space>fwf", ":lua require('fzf-lua').files({cwd='~/vimwiki'})<CR>",
        { noremap = true, desc = "Search files in vimwiki" })

-- make fzf the default select ui
fzfLua.register_ui_select()

fzfLua.setup({
        keymap = {
                fzf = {
                        ["ctrl-a"] = "select-all+accept"
                }
        }
})
