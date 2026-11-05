{
  pkgs,
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
{
  mise = rustPlatform.buildRustPackage (finalAttrs: {
    pname = "mise";
    version = "v2026.10.5";

    src = fetchFromGitHub {
      owner = "jdx";
      repo = "mise";
      tag = finalAttrs.version;
      hash = "sha256-2ca4K/BWuT4jdO3yjjQcwtB1lwieqYaBrdOUBoa7r/I=";
    };

    cargoHash = "sha256-ruo/ZOhri7U6RIJkBG5z+PCtXM1qTxYrzqNUmJPxnWY=";

    buildInputs = [
      pkgs.openssl
    ];

    nativeBuildInputs = [
      pkgs.cmake
      pkgs.pkg-config
    ];

    doCheck = false;

  });
}
