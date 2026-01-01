{ config, ... }:
{
  flake.modules.nixos.virtualisation = {
    programs = {
      dconf.enable = true;
      virt-manager.enable = true;
    };

    users.groups.libvirtd.members = [ config.flake.meta.vic.username ];
    users.users.${config.flake.meta.vic.username}.extraGroups = [ "libvirtd" ];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
      containers.enable = true;
    };
  };
}
