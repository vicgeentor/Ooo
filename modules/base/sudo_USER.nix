{ config, ... }:
{
  flake.modules.nixos.base = {
    users.users.${config.flake.meta.vic.username}.extraGroups = [
      "wheel"
      "systemd-journal"
    ];
  };
}
