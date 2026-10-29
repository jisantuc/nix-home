vim.api.nvim_set_keymap("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>", { noremap = true, desc = "Code lens" })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>",
        { noremap = true, desc = "Show buffer diagnostics" })

local enabled_lsp_langs = { "elixir", "python", "lua", "nix", "typst", "c", "jinja", "elm" }

vim.lsp.enable(enabled_lsp_langs)
