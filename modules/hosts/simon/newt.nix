{ config, ... }:
{
  flake.modules.nixos.simon = nixosArgs: {
    imports = [ config.flake.modules.nixos.newt ];

    age.secrets.newt-simon.file = ../../../_secrets/newt-simon.age;
    services.newt.environmentFile = nixosArgs.config.age.secrets.newt-simon.path;
  };
}
