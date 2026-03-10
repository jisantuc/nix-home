{ rustPlatform
, lib
, fetchFromGitHub
}:
{
  repeater = rustPlatform.buildRustPackage
    (finalAttrs: {
      pname = "repeater";
      version = "v0.1.6";

      src = fetchFromGitHub {
        owner = "shaankhosla";
        repo = "repeater";
        tag = finalAttrs.version;
        hash = "sha256-ONbFUcLwzWJMyGUZZBvUYfTnVUEzyO4TYDQCL/ykdFU=";
      };

      cargoHash = "sha256-KlvXr52bnVqVuzho2RIKRD6NsORicTtUdABt/ZL6Dwc=";

    });
}
