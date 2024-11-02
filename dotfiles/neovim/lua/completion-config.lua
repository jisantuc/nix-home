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
                { name = "orgmode" }
        }, { name = "buffer" }),
        mapping = cmp.mapping.preset.insert({
                ['<C-g>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                                luasnip.jump(1)
                        else
                                fallback()
                        end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                                luasnip.jump(-1)
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
