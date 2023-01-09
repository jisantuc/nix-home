local cmp = require("cmp")

cmp.setup({
  -- add additional completion sources here
  -- names for completion sources will often be documented in other
  -- plugins' readmes
  sources = cmp.config.sources({
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "treesitter", max_item_count = 10 },
    { name = "luasnip" },
    { name = "orgmode" }
  }, { name = "buffer" }),
  mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true })
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

