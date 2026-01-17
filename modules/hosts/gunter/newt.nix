{ config, ... }:
{
  flake.modules.nixos.gunter = nixosArgs: {
    imports = [ config.flake.modules.nixos.newt ];

    age.secrets.newt-gunter.file = ../../../_secrets/newt-gunter.age;
    services.newt.environmentFile = nixosArgs.config.age.secrets.newt-gunter.path;
  };
}
