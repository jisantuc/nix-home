-- init.lua
-- this file shoul dhold only things that don't go with other things
-- for instance, there's only one configuration that has to do with Markdown previewing --
-- this wouldn't make sense to put in a markdown preview config, because there's nothinge else
-- that would go there.
-- meanwhile, lots of things have to do with setting up and configuring LSP for different languages,
-- so they all hang out together in lsp-config.lua

require("completion-config")
require("custom-jq-config")
require("custom-lsp-config")
require("custom-orgmode")
require("custom-vimwiki")
require("fzf-config")
require("git-config")
require("tree-config")
require("treesitter")
require("vim-stuff")
