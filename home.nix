{ config, pkgs, ... }:

let
  shellUtilities = [
    pkgs.graphviz
    pkgs.jq
    pkgs.ripgrep
    pkgs.tree
    pkgs.bash-completion
  ];

  scalaDeps = [
    pkgs.ammonite
    pkgs.coursier
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
    pkgs.rnix-lsp
  ];

in
rec {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "james";
  home.homeDirectory = if builtins.currentSystem == "x86_64-linux" then "/home/${home.username}/" else "/Users/${home.username}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

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
          nvim-compe
          nvim-dap
          nvim-jdtls
          nvim-metals
          plenary-nvim
          vim-colors-solarized
	  vim-nix
        ];
	
      extraConfig = builtins.readFile ./dotfiles/vimrc;
    };
  };


  home.packages = shellUtilities ++ systemUtilities ++ scalaDeps ++ ourobouros;
}
