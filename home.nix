{ config, pkgs, ... }:

let

  shellUtilities = [
    pkgs.jq
    pkgs.ripgrep
    pkgs.tree
  ];

  scalaDeps = [
    pkgs.ammonite
  ];

  systemUtilities = [
    pkgs.asciinema
    pkgs.direnv
    pkgs.htop
    pkgs.httpie
    pkgs.imagemagick
    pkgs.tmux
    pkgs.wget
  ];

  # Packages I need because it'll be a nix-y system
  ourobouros = [
    pkgs.nixpkgs-fmt
    pkgs.rnix-lsp
  ];

in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "james";
  home.homeDirectory = "/Users/james";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = shellUtilities ++ systemUtilities ++ scalaDeps ++ ourobouros;
}
