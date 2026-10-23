# Nix Recipes

This file contains some useful Nix expressions that I always
forget

## Installing a Nixpkgs package from a Nixpkgs input

```nix
inputs.nixpkgs-name.legacyPackages.${pkgs.stdenv.hostPlatform.system}.package-name
```

## Installing an unsafe package from a Nixpkgs input

```nix
let
  pkgs' = import inputs.nixpkgs-name {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
```

## Installing a flake package from a flake input

```nix
inputs.input-name.packages.${pkgs.stdenv.hostPlatform.system}.default
```

## Write down a user home directory

```nix
"/home/${config.flake.meta.vic.username}"
```
