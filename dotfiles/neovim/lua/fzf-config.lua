local fzfLua = require("fzf-lua")

local default_vimwiki_dir = "~/vimwiki"

local function list_vimwiki_todos()
        local searchString = "[ ]"
        fzfLua.grep({ cwd = default_vimwiki_dir, search = searchString })
end

-- make find much better
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.bloop/*"
vim.opt.wildignore:append "**/target/*"
vim.opt.wildignore:append "**/.bsp/*"
vim.opt.wildignore:append "**/.metals/*"
vim.keymap.set("n", "<space>fb", "<cmd>:FzfLua buffers<CR>", { noremap = true, desc = "Choose open buffer" })
vim.keymap.set("n", "<space>fL", "<cmd>:FzfLua lines<CR>", { noremap = true, desc = "Choose file in workspace" })
vim.keymap.set("n", "<space>ff", "<cmd>:FzfLua files<CR>", { noremap = true, desc = "Choose file in workspace" })
vim.keymap.set("n", "<space>fg", "<cmd>:FzfLua git_files<CR>", { noremap = true, desc = "Choose git file" })
vim.keymap.set("n", "<space>fs", "<cmd>:FzfLua grep_project<CR>",
        { noremap = true, desc = "Search string in project" })
vim.keymap.set("n", "<space>fr", "<cmd>:FzfLua resume<CR>", { noremap = true, desc = "Fzf resume" })
vim.keymap.set("n", "<space>fls", "<cmd>:FzfLua grep_last<CR>",
        { noremap = true, desc = "Repeat last search" })
vim.keymap.set("n", "<space>fws", ":lua require('fzf-lua').live_grep_native({cwd='~/vimwiki'})<CR>",
        { noremap = true, desc = "Search in vimwiki" })
vim.keymap.set("n", "<space>fwf", ":lua require('fzf-lua').files({cwd='~/vimwiki'})<CR>",
        { noremap = true, desc = "Search files in vimwiki" })
vim.keymap.set("n", "<space>fwt", list_vimwiki_todos, { noremap = true, desc = "List incomplete todos" })
vim.keymap.set("n", "<space>fhs", ":lua require('fzf-lua').live_grep_native({cwd='./http-requests'})<CR>",
        { noremap = true, desc = "Search in http-requests" })
vim.keymap.set("n", "<space>fhf", ":lua require('fzf-lua').files({cwd='./http-requests'})<CR>",
        { noremap = true, desc = "Search files http-requests" })

-- make fzf the default select ui
fzfLua.register_ui_select()

fzfLua.setup({
        keymap = {
                fzf = {
                        ["ctrl-a"] = "select-all+accept"
                }
        }
})
