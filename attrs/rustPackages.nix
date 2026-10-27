{
  pkgs,
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
{
  mise = rustPlatform.buildRustPackage (finalAttrs: {
    pname = "mise";
    version = "v2026.9.10";

    src = fetchFromGitHub {
      owner = "jdx";
      repo = "mise";
      tag = finalAttrs.version;
      hash = "sha256-aK1z0Vc2TLU0NtJ7vVJNLdv2KY+bNdT6bmSSGF92fiY=";
    };

    cargoHash = "sha256-F3vx9neTX5yA36gRx/7Mk4LDCPYBUxPsqkfCPW+rm4I=";

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
