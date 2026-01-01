{ config, ... }:
{
  flake.modules.nixos.neptr = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base
      ];
    };
  };
}
