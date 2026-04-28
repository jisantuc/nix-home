# nix-home
Repo for nix-home-manager experiments and adventures

## Bootstrapping

* set up `nix.conf` in `$HOME/.config/nix/nix.conf` with

```conf
experimental-features = nix-command flakes
download-buffer-size = 500000000

substituters         = https://cache.iog.io https://cache.nixos.org
trusted-substituters =
trusted-public-keys  = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
```

* add any substituters I've forgotten here
* `./scripts/switch linux-x86|macos-arm|...`
