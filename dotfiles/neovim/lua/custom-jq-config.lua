jqConfig = require('nvim-jqx.config')

jqConfig.close_window_key = 'q'

-- add bindings for querying and listing keys
vim.api.nvim_set_keymap(
  "n", "<leader>jq", "<cmd>JqxQuery<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<leader>jl", "<cmd>JqxList<CR>", { noremap = true }
)
