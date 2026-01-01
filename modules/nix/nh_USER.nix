{ config, ... }:
{
  flake.modules.nixos.nh = {
    programs.nh = {
      enable = true;
      flake = "/home/${config.flake.meta.vic.username}/Ooo";
    };
  };
}
