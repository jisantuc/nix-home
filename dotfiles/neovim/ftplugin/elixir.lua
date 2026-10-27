vim.lsp.codelens.enable(true)

require("neotest").setup {
        adapters = {
                require("neotest-elixir")
        }
}
