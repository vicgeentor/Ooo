{ inputs, ... }:
{
  flake.modules.nixos.tdarr =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.nixpkgs-tdarr.legacyPackages.${pkgs.stdenv.hostPlatform.system}.tdarr
      ];
    };
}
