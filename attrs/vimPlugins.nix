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
      # f2bf2846221954e6a47f6659ff330e1a823c69eb
      rev = "master";
      hash = "sha256-RoiTv2yTw6pkvkrKBz2T1MV3t5X3RjIMK+z/PMRNEdE=";
    };
  };
  renderMarkdownNvimPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "markdown.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MeanderingProgrammer";
      repo = "render-markdown.nvim";
      rev = "v8.13.0";
      hash = "sha256-ukJUaqEYI60o/lyLM5GaKsRdMW/24IZnzVzPB9/Q/zo=";
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
