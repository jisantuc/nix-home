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
    pkgs.htop
    # pkgs.httpie
    pkgs.imagemagick
    pkgs.wget
  ];

  # Packages I need because it'll be a nix-y system
  ourobouros = [
    pkgs.cachix
    pkgs.nixpkgs-fmt
  ];

  patchedFonts = [
    # need the parens because otherwise the space makes it look like list entries
    (pkgs.nerdfonts.override { fonts = [ "Hasklig" "SourceCodePro" ]; })
  ];

  lazyGitNeovimConfig =
    let
      extraConfigLines = builtins.readFile ./neovim/extra.lua;
      configFileLocation =
        if builtins.currentSystem == "x86_64-darwin"
        then "Library/Application Support/lazygit/config.yml"
        else ".config/lazygit/config.yml";
    in
    builtins.replaceStrings [ "SUBSTITUTE" ] [ "${builtins.getEnv "HOME"}/${configFileLocation}" ] extraConfigLines;
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

  xdg.configFile."nvim/lua/lazygit-config-extra.lua".text = lazyGitNeovimConfig;

  xdg.configFile.fish = {
    source = ./fish;
    recursive = true;
  };

  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    lazygit = {
      enable = true;
      settings.gui = {
        theme.lightTheme = true;
        showIcons = true;
      };
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
          git-blame-nvim
          lazygit-nvim
          luasnip
          neogit
          nvim-cmp
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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # Enable and configure zshell
    fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        { name = "bass"; src = bass.src; }
      ];
    };

    # Enable starship, a universal prompt controller
    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = import ./dotfiles/starship.nix;
    };

    # Enable and configure tmux
    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/tmux.conf;
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
