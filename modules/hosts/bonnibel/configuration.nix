{
  flake.modules.nixos.bonnibel = {

    networking.hostName = "bonnibel";
    system.stateVersion = "25.11";

    services.tailscale.extraUpFlags = [
      "--accept-dns=false"
      "--netfilter-mode=nodivert"
      "--ssh"
    ];

    boot.loader = {
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };

    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH"
    ];

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
