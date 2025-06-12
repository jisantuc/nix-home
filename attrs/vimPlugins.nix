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
  renderMarkdownNvimPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "markdown.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MeanderingProgrammer";
      repo = "render-markdown.nvim";
      rev = "v8.4.0";
      hash = "sha256-XRecogbzrJBB4EnulhVx1BiY+k9/O4SlxXYMA6i6DX0=";
    };
  };
  kulalaNvim = (pkgs.vimUtils.buildVimPlugin {
    name = "kulala.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mistweaverco";
      repo = "kulala.nvim";
      rev = "v5.3.0";
      hash = "sha256-+Wor0L3NxTCXIZBdpX0ylOu26N5z8nFwinrzeRtFxOE=";
    };
  }).overrideAttrs (old: {
    nvimRequireCheck = [
      "kulala.external_processing.init"
      "kulala"
      "kulala.utils.table"
      "kulala.utils.fs"
      "kulala.utils.json"
      "kulala.utils.string"
      "kulala.utils.ascii"
      "kulala.utils.async"
      "kulala.globals.init"
      "kulala.augroups.init"
      "kulala.internal_processing.init"
      "kulala.api.init"
      "kulala.inlay.init"
      "kulala.config.init"
      "kulala.config.keymaps"
      "kulala.config.defaults"
      "kulala.formatter.init"
      "kulala.lib.shlex.init"
      "kulala.lib.shlex.stringreader"
      "kulala.parser.dynamic_vars"
      "kulala.parser.utils"
      "kulala.parser.jsonpath"
      "kulala.parser.string_variables_parser"
      "kulala.parser.graphql"
      "kulala.parser.treesitter"
      "kulala.parser.request_variables"
      "kulala.parser.inspect"
      "kulala.parser.env"
      "kulala.parser.request"
      "kulala.parser.curl"
      "kulala.parser.document"
      "kulala.graphql.init"
      "kulala.logger.init"
      "kulala.cmd.init"
      "kulala.cmd.lsp"
      "kulala.cmd.tcp"
      "kulala.cmd.oauth"
      "kulala.cmd.websocket"
      "kulala.cmd.shell_utils"
      "kulala.cmd.fmt"
      "kulala.cmd.crypto"
      "kulala.db.init"
      "kulala.health"
      "kulala.jumps.init"
      "kulala.ui.init"
      "kulala.ui.utils"
      "kulala.ui.float"
      "kulala.ui.env_manager"
      "kulala.ui.treesitter"
      "kulala.ui.winbar"
      "kulala.ui.auth_manager"
      "kulala.ui.report"
      "kulala.ui.callbacks"
      "kulala.ui.request_manager"
      "cli.config"
      "cli.colors"
      "cli.argparse"
    ];
  });
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
  kulalaNvim
  lazygit-nvim
  luasnip
  markdown-preview-nvim
  renderMarkdownNvimPlugin
  neotest
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
  vimwiki
  which-key-nvim
]
