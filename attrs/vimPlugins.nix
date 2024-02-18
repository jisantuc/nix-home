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
  siliconPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "vim-silicon";
    src = pkgs.fetchFromGitHub {
      owner = "segeljakt";
      repo = "vim-silicon";
      rev = "4a93122ae2139a12e2a56f064d086c05160b6835";
      hash = "sha256-8pCHtApD/xXav2UBVOVhkaHg3YS4aNCZ73mog04bYuA=";
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
  markdown-preview-nvim
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
  siliconPlugin
  rest-nvim
  vim-colors-solarized
  vim-nix
  vimwiki
  which-key-nvim
]
