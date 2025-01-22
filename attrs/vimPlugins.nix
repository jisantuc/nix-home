{ pkgs, vimPlugins, treesitterGrammars, ... }:
let
  calendarPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "calendar-vim";
    src = pkgs.fetchFromGitHub {
      owner = "mattn";
      repo = "calendar-vim";
      rev = "2083a41e2d310f9bbbbf644517f30e901f1fb04d";
      hash = "sha256-uOiKzhl+3Pi0pFLecQqUWveN+1Z3Tu/UiSPBmS+bio8=";
    };
  };
  markdownNvimPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "markdown.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MeanderingProgrammer";
      repo = "markdown.nvim";
      rev = "87b9fda112cc72d14a4fac3cf1f1c1e65d0f4852";
      hash = "sha256-zV97e+at7tEi7d4QP226uYnHf49p7fKXM3BDk8Mu+NE=";
    };
  };
in
with vimPlugins;
[
  (nvim-treesitter.withPlugins treesitterGrammars)
  calendarPlugin
  cmp-buffer
  cmp_luasnip
  cmp-nvim-lsp
  cmp-treesitter
  dhall-vim
  fzf-lua
  git-blame-nvim
  haskell-tools-nvim
  lazygit-nvim
  luasnip
  markdown-preview-nvim
  markdownNvimPlugin
  neotest
  neotest-haskell
  neotest-python
  nvim-cmp
  nvim-dap
  nvim-dap-ui
  nvim-dap-virtual-text
  nvim-dap-python
  nvim-lspconfig
  nvim-metals
  nvim-tree-lua
  nvim-web-devicons
  plenary-nvim
  purescript-vim
  rose-pine
  rest-nvim
  tabular
  todo-comments-nvim
  vim-nix
  vimwiki
  which-key-nvim
]
