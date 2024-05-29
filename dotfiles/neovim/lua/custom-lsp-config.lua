-- activate and configure metals
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", ".worksheet.sc" },
        callback = function()
                require("metals").initialize_or_attach({})
        end,
        group = nvim_metals_group,
})

local metals_config = require("metals").bare_config()
metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = {
                "akka.actor.typed.javadsl",
                "com.github.swagger.akka.javadsl"
        }
}
metals_config.init_options.statusBarProvider = "on"

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- activate terraform-ls
require("lspconfig").terraformls.setup {}

-- activate nil_ls
require("lspconfig").nil_ls.setup {
        settings = {
                ['nil'] = {
                        formatting = {
                                command = { "nixpkgs-fmt" },
                        },
                },
        }
}

-- set up lua language server specifically for nvim files
-- see docs:
-- https://github.com/neovim/nvim-lspconfig/blob/2b361e043810d5587d9af0787f8ce40da92ec5e9/doc/server_configurations.md#lua_ls
require("lspconfig").lua_ls.setup {
        on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                                Lua = {
                                        runtime = {
                                                -- Tell the language server which version of Lua you're using
                                                -- (most likely LuaJIT in the case of Neovim)
                                                version = 'LuaJIT'
                                        },
                                        -- Make the server aware of Neovim runtime files
                                        workspace = {
                                                checkThirdParty = false,
                                                library = {
                                                        vim.env.VIMRUNTIME
                                                }
                                        }
                                }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
        end

}

-- activate purescript ls
require("lspconfig").purescriptls.setup {}

-- activate typescript ls
require("lspconfig").tsserver.setup {}

-- activate hls
require('haskell-tools')

-- activate dhall ls
require("lspconfig").dhall_lsp_server.setup {}

-- activate kotlin ls
require("lspconfig").kotlin_language_server.setup({})

-- activate pyright
require("lspconfig").pyright.setup {}

-- configure lsp keybindings
vim.api.nvim_set_keymap(
        "n",                                          -- mode
        "gd",                                         -- key chord
        "<cmd>lua vim.lsp.buf.definition()<CR>",      -- command to execute
        { noremap = true, desc = "Go to definition" } -- some options, I don"t know what I can do here
)

vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, desc = "Show hint at point" })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
        { noremap = true, desc = "Go to implementation" })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, desc = "Go to references" })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",
        { noremap = true, desc = "Rename symbol" })
vim.api.nvim_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
        { noremap = true, desc = "Format buffer" })
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
        { noremap = true, desc = "Code action" })
vim.api.nvim_set_keymap("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>", { noremap = true, desc = "Code lens" })
vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>lua vim.diagnostic.setqflist()<CR>",
        { noremap = true, desc = "Show all diagnostics" })
vim.api.nvim_set_keymap("n", "<leader>ae", "<cmd>lua vim.diagnostic.setqflist({severity = \"E\"})<CR>",
        { noremap = true, desc = "Show error diagnostics" })
vim.api.nvim_set_keymap("n", "<leader>aw", "<cmd>lua vim.diagnostic.setqflist({severity = \"W\"})<CR>",
        { noremap = true, desc = "Show warning diagnostics" })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>",
        { noremap = true, desc = "Show buffer diagnostics" })
