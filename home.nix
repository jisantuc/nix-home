{ pkgs, ... }:

let
  shellUtilities = [
    # visualize dot files with the dot command
    # https://graphviz.org/
    pkgs.graphviz
    # traverse json with the jq command
    # https://stedolan.github.io/jq/
    pkgs.jq
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
    # nicer view of system resource utilization
    # https://htop.dev/
    pkgs.htop
    # curl for humans
    # https://httpie.io/
    pkgs.httpie
    # all kinds of image utilities, mainly I use it for converting between formats
    # https://imagemagick.org/index.php
    pkgs.imagemagick
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
    # need the parens because otherwise the space makes it look like list entries
    (pkgs.nerdfonts.override { fonts = [ "Hasklig" "SourceCodePro" ]; })
  ];

  treesitterGrammars = (p: [
    p.fish
    p.haskell
    p.java
    p.javascript
    p.json
    p.kotlin
    p.markdown
    p.markdown-inline
    p.nix
    p.org
    p.python
    p.scala
    p.sql
    p.tsx
    p.typescript
    p.vim
    p.yaml
  ]);
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
    source = ./dotfiles/neovim;
    recursive = true;
  };

  xdg.configFile.fish = {
    source = ./dotfiles/fish;
    recursive = true;
  };

  xdg.configFile."lazygit/config.yml".text = builtins.readFile ./dotfiles/lazygit.yml;

  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    lazygit = {
      enable = true;
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      plugins =
        with pkgs.vimPlugins;
        [
          (nvim-treesitter.withPlugins treesitterGrammars)
          cmp-buffer
          cmp-nvim-lsp
          cmp-treesitter
          dhall-vim
          fzf-lua
          git-blame-nvim
          haskell-tools-nvim
          lazygit-nvim
          luasnip
          neogit
          nvim-cmp
          nvim-jqx
          nvim-lspconfig
          nvim-metals
          nvim-tree-lua
          nvim-web-devicons
          orgmode
          plenary-nvim
          purescript-vim
          vim-colors-solarized
          vim-nix
          vimwiki
          which-key-nvim
        ];
      extraPackages = with pkgs; [
        dhall-lsp-server
        discount # maybe not needed? try removing once template source location config is working
        fzf
        kotlin-language-server
        nodePackages.typescript-language-server
        (python3.withPackages (ps: [
          ps.flake8
          ps.python-lsp-server
          ps.pylsp-mypy
          ps.python-lsp-black
        ]))
        rnix-lsp
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
    patchedFonts;
}
