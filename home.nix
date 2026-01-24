{ pkgs, ... }:

let
  secrets = import ./secrets.nix;
  envHome = builtins.getEnv "HOME";

  macUtilities = pkgs.lib.optionals pkgs.stdenv.isDarwin [
    pkgs.iterm2
  ];

  shellUtilities = [
    # visualize dot files with the dot command
    # https://graphviz.org/
    pkgs.graphviz
    # traverse json with the jq command
    # https://stedolan.github.io/jq/
    pkgs.jq
    # make it so terminals can print images nicely, maybe
    # https://saitoha.github.io/libsixel/
    pkgs.libsixel
    # faster grep with rg
    # https://github.com/BurntSushi/ripgrep
    pkgs.ripgrep
    # view full file tree under cwd with tree
    pkgs.tree
  ];

  systemUtilities = [
    # record terminal activity
    # https://asciinema.org/
    pkgs.asciinema
    # transparent (to end-user) encrypt/decrypt of secrets in a git repository
    # https://github.com/AGWA/git-crypt
    pkgs.git-crypt
    # nicer view of system resource utilization
    # https://htop.dev/
    pkgs.htop
    # curl for humans
    # https://httpie.io/
    pkgs.httpie
    # all kinds of image utilities, mainly I use it for converting between formats
    # https://imagemagick.org/index.php
    pkgs.imagemagick
    # jwt-cli, for command line decoding JWTs. I have to check which JWT I'm using
    # all the time.
    pkgs.jwt-cli
    # library-ization of the claim that all structured text is the same
    # https://pandoc.org/
    pkgs.pandoc
    # https://github.com/jaspervdj/patat
    pkgs.haskellPackages.patat
    # also like upgraded curl but mainly useful for downloading files
    # https://www.gnu.org/software/wget/
    pkgs.wget
    # presentations from the terminal
  ];

  # Packages I need because it'll be a nix-y system
  ourobouros = [
    pkgs.bash-completion
    pkgs.nixpkgs-fmt
  ];

  patchedFonts = [
    pkgs.nerd-fonts.hasklug
  ];

  treesitterGrammars = (p:
    (import attrs/treesitterGrammars.nix) { inherit p; }
  );
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = envHome;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  xdg.configFile.nvim = {
    source = ./dotfiles/neovim;
    recursive = true;
  };

  xdg.configFile.fish = {
    source = ./dotfiles/fish;
    recursive = true;
  };

  xdg.configFile."fish/secrets.fish".text = ''
    set -gx CACHIX_AUTH_TOKEN ${secrets.cachixToken}
  '';

  xdg.configFile."direnv/lib" = {
    source = ./dotfiles/direnv/lib;
    recursive = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };

  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;
      settings = {
        user.email = secrets.userEmail;
        user.name = secrets.userName;
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "${envHome}/.ssh/allowed-signers";
        user.signingKey = "~/.ssh/id_rsa.pub";
        commit.gpgsign = true;
        core.excludesFile = "${envHome}/.gitignore";
        init.defaultBranch = "main";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          nerdFontsVersion = "3";
          theme = {
            lightTheme = true;
          };
        };
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      plugins = (import ./attrs/vimPlugins.nix) {
        vimPlugins = pkgs.vimPlugins;
        inherit pkgs treesitterGrammars;
      };

      extraLuaPackages = (ps:
        [
          ps.lua-curl
          ps.mimetypes
          ps.xml2lua
        ]);
      extraPackages = with pkgs;
        [
          fzf
          lua-language-server
          nil
          pyright
          python3Packages.pylatexenc
          silicon
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
    ourobouros ++
    patchedFonts ++
    macUtilities;
}
