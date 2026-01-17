{
  flake.modules.nixos.gunther = {

    networking.hostName = "gunther";
    system.stateVersion = "26.05";

    boot.loader.efi.canTouchEfiVariables = true;

    # Minecraft raw TCP stream through pangolin
    networking.firewall.allowedTCPPorts = [
      25565
    ];
  };
}
