{ pkgs, vimPlugins, treesitterGrammars, ... }:
let
  calendarPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "calendar-vim";
    src = pkgs.fetchFromGitHub {
      owner = "mattn";
      repo = "calendar-vim";
      rev = "2083a41e2d310f9bbbbf644517f30e901f1fb04d";
      hash = "sha256-uOiKzhl+3Pi0pFLecQqUWveN+1Z3Tu/UiSPBmS+bio8=";
    };
  };
  nvim-test = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-test";
    src = pkgs.fetchFromGitHub {
      owner = "klen";
      repo = "nvim-test";
      rev = "1.4.1";
      hash = "sha256-mMi07UbMWmC75DFfW1b+sR2uRPxizibFwS2qcN9rpLI=";
    };
  };
in
with vimPlugins;
[
  (nvim-treesitter.withPlugins treesitterGrammars)
  calendarPlugin
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
  nvim-test
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
