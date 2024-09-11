vim.opt.colorcolumn = "120"

require("neotest").setup {
        adapters = {
                require("neotest-haskell") {
                        build_tools = { "cabal" },
                        frameworks = { "hspec", "tasty", "sydtest" },
                },
        }
}

