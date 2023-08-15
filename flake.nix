{
  description = "@jisantuc home manager flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:

    let
      mkHome = { system }: import ./hm-lib.nix {
        inherit nixpkgs home-manager system;
      };
    in
    flake-utils.lib.eachDefaultSystem (system: {
      homeConfigurations = mkHome { inherit system; };
    });
}
