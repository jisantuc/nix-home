{ pkgs, ... }:

let
  shellUtilities = [
    pkgs.graphviz
    pkgs.jq
    pkgs.ripgrep
    pkgs.tree
    pkgs.bash-completion
  ];

  jvmDeps = [
    pkgs.ammonite
    pkgs.coursier
    (pkgs.sbt.override { jre = pkgs.openjdk11; })
  ];

  systemUtilities = [
    pkgs.asciinema
    pkgs.direnv
    pkgs.htop
    pkgs.httpie
    pkgs.imagemagick
    pkgs.scc
    pkgs.wget
  ];

  # Packages I need because it'll be a nix-y system
  ourobouros = [
    pkgs.nixpkgs-fmt
  ];

  patchedFonts = [
    # need the parens because otherwise the space makes it look like list entries
    (pkgs.nerdfonts.override { fonts = [ "Hasklig" "SourceCodePro" ]; })
  ];

in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "james";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";


  xdg.configFile.nvim = {
    source = ./neovim;
    recursive = true;
  };


  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # Enable and configure tmux
    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/tmux.conf;
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      plugins =
        with pkgs.vimPlugins;
        [
          cmp-nvim-lsp
          fzf-lua
          luasnip
          markdown-preview-nvim
          neogit
          nvim-cmp
          nvim-dap
          nvim-jdtls
          nvim-lspconfig
          nvim-metals
          nvim-tree-lua
          nvim-web-devicons
          plenary-nvim
          purescript-vim
          vim-colors-solarized
          vim-nix
        ];
      extraPackages = with pkgs; [
        fzf
        jdt-language-server
        rnix-lsp
        nodePackages.typescript-language-server
      ];
    };
  };

  fonts.fontconfig.enable = true;

  home.packages =
    shellUtilities ++
    systemUtilities ++
    jvmDeps ++
    ourobouros ++
    patchedFonts;
}
