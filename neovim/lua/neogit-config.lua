-- setup neogit
local neogit = require("neogit")
neogit.setup {
  kind = "vsplit"
}

-- launch git conveniently
vim.api.nvim_set_keymap("n", "<space>gs", "<cmd>:Neogit<CR>", { noremap = true })
