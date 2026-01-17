{ config, ... }:
{
  flake.modules.nixos.gunther = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base
      ];
    };
  };
}
