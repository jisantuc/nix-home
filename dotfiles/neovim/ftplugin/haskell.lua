vim.opt.colorcolumn = "120"
vim.opt.textwidth = 119

require("neotest").setup {
        adapters = {
                require("neotest-haskell") {
                        build_tools = { "cabal" },
                        frameworks = { "hspec", "tasty", "sydtest" },
                },
        }
}

