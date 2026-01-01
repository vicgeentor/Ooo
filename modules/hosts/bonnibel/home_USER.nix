{ config, ... }:
{
  flake.modules.nixos.bonnibel = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base
      ];
    };
  };
}
