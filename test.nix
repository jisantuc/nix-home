{ pkgs ? import <nixpkgs>
, config ? { }
}: 
  let home = import ./home.nix;
   in home { config = config; pkgs = pkgs; }
