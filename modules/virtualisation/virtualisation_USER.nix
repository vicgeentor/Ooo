{ config, ... }:
{
  flake.modules.nixos.virtualisation =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        dnsmasq
      ];

      programs = {
        dconf.enable = true;
        virt-manager.enable = true;
      };

      users.groups.libvirtd.members = [ config.flake.meta.vic.username ];
      users.users.${config.flake.meta.vic.username}.extraGroups = [ "libvirtd" ];

      virtualisation = {
        libvirtd = {
          enable = true;
          qemu = {
            swtpm.enable = true;
            vhostUserPackages = with pkgs; [ virtiofsd ];
          };
        };
        spiceUSBRedirection.enable = true;
        containers.enable = true;
      };
    };
}
