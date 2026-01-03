{
  flake.modules.nixos.simon = {

    networking.hostName = "simon";
    system.stateVersion = "24.11";

    services.tailscale.extraUpFlags = [
      "--accept-dns=false"
      "--netfilter-mode=nodivert"
      "--ssh"
    ];

    boot = {
      loader.efi.canTouchEfiVariables = true;
      extraModprobeConfig = ''
        options snd_hda_intel power_save=0
      '';
    };

    networking.firewall.allowedTCPPorts = [
      22
      80
      443
      25565 # Minecraft raw TCP stream through pangolin
    ];
    networking.firewall.allowedUDPPorts = [
      21820
      51820
    ];
  };
}
