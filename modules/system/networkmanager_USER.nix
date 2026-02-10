{ config, ... }:
{
  flake.modules.nixos.networkmanager = {
    networking.networkmanager.enable = true;

    users.users.${config.flake.meta.vic.username}.extraGroups = [ "networkmanager" ];

    # Not needed anymore with dms-shell
    programs.nm-applet = {
      enable = false;
      indicator = false;
    };
  };
}
