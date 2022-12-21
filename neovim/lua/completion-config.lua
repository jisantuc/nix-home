require("cmp").setup({
  -- add additional completion sources here
  -- names for completion sources will often be documented in other
  -- plugins' readmes
  sources = {
    { name = "nvim_lsp", max_item_count = 10 }
  }
})

