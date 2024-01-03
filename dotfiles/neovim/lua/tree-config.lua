-- customize nvim-tree rendering
require("nvim-tree").setup({
        renderer = {
                group_empty = true,
                highlight_git = true
        },
        view = {
                adaptive_size = true
        },
        diagnostics = { enable = true },
        filters = { dotfiles = false }
})

-- tree view mappings
-- launch it
vim.api.nvim_set_keymap("n", "<space>tt", "<cmd>:NvimTreeToggle<CR>", { noremap = true, desc = "Toggle file tree" })
-- find file
vim.api.nvim_set_keymap("n", "<space>tf", "<cmd>:NvimTreeFindFile<CR>",
        { noremap = true, desc = "Find buffer file in file tree" })

require("nvim-web-devicons").setup {
        color_icons = true,
        default = true,
}
