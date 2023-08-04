{ nixpkgs, home-manager, system, ... }:
home-manager.lib.homeManagerConfiguration rec {
  pkgs = import nixpkgs {
    inherit system;
  };
  modules = [ ./home.nix ];
}
