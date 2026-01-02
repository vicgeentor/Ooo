{ config, ... }:
{
  flake.modules.nixos.jake =
    { pkgs, ... }:
    {

      networking.hostName = "jake";
      system.stateVersion = "25.05";

      boot = {
        loader.efi.canTouchEfiVariables = true;
        extraModprobeConfig = ''
          options snd_hda_intel power_save=0
        '';
        supportedFilesystems = [ "ntfs" ]; # Yes, I dual-boot Windows
      };

      hardware.nvidia.prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      environment.etc."nsswitch.conf".text = ''
        hosts: files dns
      '';

      services = {
        libinput.enable = true;
        printing.enable = true;
      };

      networking = {
        networkmanager = {
          enable = true;
          dns = "systemd-resolved";
        };
        useNetworkd = true;
      };

      services.resolved.enable = true;

      environment.systemPackages = [ pkgs.unixtools.ifconfig ];

      users.users.${config.flake.meta.vic.username}.extraGroups = [ "networkmanager" ];
    };
}
