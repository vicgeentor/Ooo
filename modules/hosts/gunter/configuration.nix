{
  flake.modules.nixos.gunter = {

    # These three are required
    networking.hostName = "gunter";
    system.stateVersion = "26.05";
    hardware.facter.reportPath = ./facter.json;

    boot.loader.efi.canTouchEfiVariables = true;

    # Minecraft raw TCP stream through pangolin
    networking.firewall.allowedTCPPorts = [
      25565
    ];
  };
}
