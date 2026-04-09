local wiki = {};
wiki.path = "~/vimwiki/";
wiki.syntax = "markdown";
wiki.ext = "md";

local photowiki = {
        path = "~/photo-wiki";
        syntax = "markdown";
        ext = "md";
}

local cardswiki = {
        path = "~/srs-cards";
        syntax = "markdown";
        ext = "md";
}

vim.g.vimwiki_list = { wiki, photowiki, cardswiki };
vim.g.vimwiki_global_ext = 0;
