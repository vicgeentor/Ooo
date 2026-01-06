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

    # Minecraft raw TCP stream through pangolin
    networking.firewall.allowedTCPPorts = [
      25565
    ];
  };
}
