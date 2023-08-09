{ vimPlugins, treesitterGrammars, ... }:
with vimPlugins;
[
  (nvim-treesitter.withPlugins treesitterGrammars)
  cmp-buffer
  cmp-nvim-lsp
  cmp-treesitter
  dhall-vim
  fzf-lua
  git-blame-nvim
  haskell-tools-nvim
  lazygit-nvim
  luasnip
  neogit
  nvim-cmp
  nvim-jqx
  nvim-lspconfig
  nvim-metals
  nvim-tree-lua
  nvim-web-devicons
  orgmode
  plenary-nvim
  purescript-vim
  rest-nvim
  vim-colors-solarized
  vim-nix
  vimwiki
  which-key-nvim
]
