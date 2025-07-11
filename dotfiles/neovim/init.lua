-- init.lua
-- this file should hold only things that don't go with other things
-- for instance, there's only one configuration that has to do with Markdown previewing --
-- this wouldn't make sense to put in a markdown preview config, because there's nothinge else
-- that would go there.
-- meanwhile, lots of things have to do with setting up and configuring LSP for different languages,
-- so they all hang out together in lsp-config.lua

require("completion-config")
require("custom-dap-config")
require("custom-lsp-config")
require("custom-luasnip")
require("custom-neotest")
require("custom-rest-nvim")
require("custom-vimwiki")
require("custom-which-key")
require("fzf-config")
require("git-config")
require("tree-config")
require("treesitter")
require("vim-stuff")
require("filetypes")

-- in ftplugin, this throws a bunch of errors. It needs to happen just once.
require("render-markdown").setup {
        completions = { lsp = { enabled = true } }
}
