{ inputs, ... }:
{
  flake.modules.nixos.tdarr-test =
    { pkgs, ... }:
    {
      imports = [ "${inputs.nixpkgs-tdarr}nixos/modules/services/misc/tdarr.nix" ];

      services.tdarr = {
        enable = true;
        package = inputs.nixpkgs-tdarr.legacyPackages.${pkgs.stdenv.hostPlatform.system}.tdarr;
        nodes.main = {
          enable = true;
        };
      };
    };
}
