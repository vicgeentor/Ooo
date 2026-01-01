{ config, ... }:
{
  flake.modules.nixos.bonnibel = {

    # Required
    networking.hostName = "bonnibel";
    system.stateVersion = "25.11";

    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH vic@nixlap"
    ];

    users.users.${config.flake.meta.vic.username}.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH vic@nixlap"
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
