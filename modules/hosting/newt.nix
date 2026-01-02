{ inputs, ... }:
{
  flake.modules.nixos.newt =
    { pkgs, ... }:
    {
      services.newt = {
        enable = true;
        package =
          inputs.nixpkgs-pangolin-stack.legacyPackages.${pkgs.stdenv.hostPlatform.system}.fosrl-newt;

        settings = {
          endpoint = "https://admin.vicgeentor.nl";
        };
        environmentFile = "/etc/nixos/secrets/newt.env";
      };
    };
}
