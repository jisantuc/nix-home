{
  pkgs,
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
{
  mise = rustPlatform.buildRustPackage (finalAttrs: {
    pname = "mise";
    version = "v2026.8.2";

    src = fetchFromGitHub {
      owner = "jdx";
      repo = "mise";
      tag = finalAttrs.version;
      hash = "sha256-ADkfsCwfqlGn6vXuHG/YiOsQuU6G4tBrF+i8pWECLxk=";
    };

    cargoHash = "sha256-16tJXdx8HG48bMvEZ/0gfLIu/gHOxM2x93lPVwwEA9w=";

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
