vim.api.nvim_set_keymap("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>", { noremap = true, desc = "Code lens" })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>",
        { noremap = true, desc = "Show buffer diagnostics" })

local enabled_lsp_langs = { "elixir", "python", "lua", "nix", "typst", "c" }

for _, lang in ipairs(enabled_lsp_langs) do
        vim.lsp.enable(lang)
end

vim.api.nvim_create_autocmd(
        { "BufEnter", "CursorHold", "InsertLeave" }, {
                callback = function(event)
                        vim.lsp.codelens.refresh({ bufnr = 0 })
                end,
                pattern = { "*.nix", "*.py", "*.lua", "*.ex", "*.typ", "*.typst", "*.c" }
        })
