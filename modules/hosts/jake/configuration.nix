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
        networkmanager.dns = "systemd-resolved";
        nameservers = [
          "1.1.1.1#one.one.one.one"
          "1.0.0.1#one.one.one.one"
          "2606:4700:4700::1111#one.one.one.one"
          "2606:4700:4700::1001#one.one.one.one"

          "8.8.8.8#dns.google"
          "8.8.4.4#dns.google"
          "2001:4860:4860::8888#dns.google"
          "2001:4860:4860::8844#dns.google"
        ];
      };

      services.resolved = {
        enable = true;
        dnssec = "true";
        domains = [ "~." ];
        fallbackDns = [
          "1.1.1.1#one.one.one.one"
          "1.0.0.1#one.one.one.one"
          "2606:4700:4700::1111#one.one.one.one"
          "2606:4700:4700::1001#one.one.one.one"

          "8.8.8.8#dns.google"
          "8.8.4.4#dns.google"
          "2001:4860:4860::8888#dns.google"
          "2001:4860:4860::8844#dns.google"
        ];
        dnsovertls = "true";
      };
    };
}
