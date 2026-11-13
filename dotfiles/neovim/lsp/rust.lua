return {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = {
                "cargo.toml"
        },
        settings = {
                ["rust-analyzer"] = {
                        imports = {
                                granularity = {
                                        group = "module",
                                },
                                prefix = "self",
                        },
                        cargo = {
                                buildScripts = {
                                        enable = true
                                }
                        },
                        procMacro = {
                                enable = true
                        },

                }
        }
}
