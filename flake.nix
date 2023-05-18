{
  description = "@jisantuc home manager flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";

    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:

    let
      mkHome = { system }: import ./hm-lib.nix {
        inherit nixpkgs home-manager system;
      };
    in
    {
      homeConfigurations = {
        linux = mkHome {
          system = "x86_64-linux";
        };
        macOS = mkHome {
          system = "x86_64-darwin";
        };
      };
    };
}
