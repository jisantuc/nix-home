-- set up lua language server specifically for nvim files
-- see docs:
-- https://github.com/neovim/nvim-lspconfig/blob/2b361e043810d5587d9af0787f8ce40da92ec5e9/doc/server_configurations.md#lua_ls

return require("lspconfig").lua_ls.setup {
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
