{
  pkgs,
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
{
  repeater = rustPlatform.buildRustPackage (finalAttrs: {
    pname = "repeater";
    version = "v0.1.10";

    src = fetchFromGitHub {
      owner = "shaankhosla";
      repo = "repeater";
      tag = finalAttrs.version;
      hash = "sha256-8TWqY78w5cOirLnrBONiratAZQSQrYpp++5dXRlFlNo=";
    };

    cargoHash = "sha256-hngZ55o1YsnstBGjp8++9SsxwfUyu+X4YwZuzMupFTE=";

  });
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

    nativeBuildInputs = [
      pkgs.cmake
    ];

    doCheck = false;

  });
}
