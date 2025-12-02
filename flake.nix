{
  description = "@jisantuc home manager flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, home-manager, flake-utils, ... }:

    let
      mkHome = { system }: import ./hm-lib.nix {
        inherit nixpkgs home-manager
          system;
      };
    in
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs =
          nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.bash ];
        };
        homeConfigurations = mkHome {
          inherit system;
        };
      });
}
