{
  description = "@jisantuc home manager flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";

    flake-utils.url = "github:numtide/flake-utils";

    tmmpr.url = "github:tanciaku/tmmpr";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, tmmpr, ... }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.${system}.default ];
        };
        mkHome = { system }: import ./hm-lib.nix {
          inherit pkgs home-manager system;
        };
      in
      {
        overlays.default = final: prev: {
          tmmpr = tmmpr.packages.${system}.default;
        };
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.bash ];
        };
        homeConfigurations = mkHome {
          inherit system;
        };
      });
}
