{
  flake.modules.nixos.bonnibel = {

    networking.hostName = "bonnibel";
    system.stateVersion = "25.11";

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
      25565
    ];

    nix.optimise.dates = [ "05:00" ];
  };
}
