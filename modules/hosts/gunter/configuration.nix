{
  flake.modules.nixos.gunter = {

    networking.hostName = "gunter";
    system.stateVersion = "26.05";

    boot.loader.efi.canTouchEfiVariables = true;

    # Minecraft raw TCP stream through pangolin
    networking.firewall.allowedTCPPorts = [
      25565
    ];
  };
}
