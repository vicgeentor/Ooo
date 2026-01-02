{
  flake.modules.nixos.simon = {

    networking.hostName = "simon";
    system.stateVersion = "24.11";

    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH vic@nixlap"
    ];

    boot = {
      loader.efi.canTouchEfiVariables = true;
      extraModprobeConfig = ''
        options snd_hda_intel power_save=0
      '';
    };

    # Minecraft raw TCP stream through pangolin
    networking.firewall.allowedTCPPorts = [
      22
      80
      443
      25565
    ];
    networking.firewall.allowedUDPPorts = [
      21820
      51820
    ];
  };
}
