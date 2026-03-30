{ rustPlatform
, lib
, fetchFromGitHub
}:
{
  repeater = rustPlatform.buildRustPackage
    (finalAttrs: {
      pname = "repeater";
      version = "v0.1.9";

      src = fetchFromGitHub {
        owner = "shaankhosla";
        repo = "repeater";
        tag = finalAttrs.version;
        hash = "sha256-vkiDJ9hGEa9PCaNjgGJAvAFGUxXJK04ezvXyAmJB3bk=";
      };

      cargoHash = "sha256-/ttQpk9JnSRhE/VOJlz60LpV1PJ/spzXQ1EPLcox1mw=";

    });
}
