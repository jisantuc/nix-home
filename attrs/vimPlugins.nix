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
  nabla-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nabla.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jbyuki";
      repo = "nabla.nvim";
      rev = "f5aff14fa3d60f4be568c444be84400812823648";
      hash = "sha256-HXhY6g9JK7dqpkgXirDSpukVrIEqBMIt7Vz3VeH52Ho=";
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
  nabla-nvim
  nvim-cmp
  nvim-dap
  nvim-dap-ui
  nvim-dap-virtual-text
  nvim-dap-python
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
