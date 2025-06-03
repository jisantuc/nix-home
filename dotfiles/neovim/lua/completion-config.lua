local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
        -- add additional completion sources here
        -- names for completion sources will often be documented in other
        -- plugins' readmes
        sources = cmp.config.sources({
                { name = "nvim_lsp",   max_item_count = 10 },
                { name = "treesitter", max_item_count = 10 },
                { name = "luasnip",    option = { show_autosnippets = true } },
                { name = "orgmode" },
                { name = "render-markdown" }
        }, { name = "buffer" }),
        mapping = cmp.mapping.preset.insert({
                ['<C-g>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                        if vim.snippet.active({ direction = 1 }) then
                                vim.snippet.jump(1)
                        elseif luasnip.locally_jumpable(1) then
                                luasnip.jump(1)
                        else
                                fallback()
                        end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.locally_jumpable(-1) then
                                luasnip.jump(-1)
                        elseif vim.snippet.active({ direction = -1 }) then
                                vim.snippet.jump(-1)
                        else
                                fallback()
                        end
                end, { "i", "s" }),
        })
})

cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
                { name = 'buffer' }
        }
})
