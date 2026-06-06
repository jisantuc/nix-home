{ rustPlatform
, lib
, fetchFromGitHub
}:
{
  repeater = rustPlatform.buildRustPackage
    (finalAttrs: {
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
}
