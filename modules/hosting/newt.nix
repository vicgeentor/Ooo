{ inputs, ... }:
{
  flake.modules.nixos.newt =
    nixosArgs@{ pkgs, ... }:
    {
      age.secrets.newt.file = ../../_secrets/newt.age;
      services.newt = {
        enable = true;
        package =
          inputs.nixpkgs-pangolin-stack.legacyPackages.${pkgs.stdenv.hostPlatform.system}.fosrl-newt;

        settings = {
          endpoint = "https://admin.vicgeentor.nl";
        };
        environmentFile = nixosArgs.config.age.secrets.newt.path;
      };
    };
}
