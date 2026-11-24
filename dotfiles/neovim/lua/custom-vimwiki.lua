local wiki = {};
wiki.path = "~/vimwiki/";
wiki.syntax = "markdown";
wiki.ext = "md";
wiki.auto_tags = 1;

local photowiki = {
        path = "~/photo-wiki",
        syntax = "markdown",
        ext = "md",
}

vim.g.vimwiki_list = { wiki, photowiki };
vim.g.vimwiki_global_ext = 0;
