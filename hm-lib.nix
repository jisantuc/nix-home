{ nixpkgs, home-manager, system, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
  };

in
home-manager.lib.homeManagerConfiguration rec {
  inherit pkgs;
  modules = [ ./home.nix ];
}
