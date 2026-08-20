{
  pkgs,
  vimPlugins,
  treesitterGrammars,
  ...
}:
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
  renderMarkdownNvimPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "markdown.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MeanderingProgrammer";
      repo = "render-markdown.nvim";
      rev = "v8.10.0";
      hash = "sha256-wNtAakOZPrzpp7btAfHZ4xseWOpdcX1QgPWNGbDYJVM=";
    };
  };
  typstPreviewPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "typst-preview.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "chomosuke";
      repo = "typst-preview.nvim";
      rev = "v1.5.0";
      hash = "sha256-UTugVfydwGTmf5RomQ0R72Yf6fSz8gGeY/fg51qW454=";
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
  mini-icons
  renderMarkdownNvimPlugin
  neotest
  neotest-elixir
  neotest-haskell
  neotest-python
  nvim-cmp
  nvim-dap
  nvim-dap-ui
  nvim-dap-virtual-text
  nvim-dap-python
  nvim-tree-lua
  nvim-web-devicons
  plenary-nvim
  rose-pine
  rest-nvim
  tabular
  todo-comments-nvim
  typstPreviewPlugin
  vimwiki
  which-key-nvim
]
