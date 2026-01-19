{
  flake.modules.nixos.gunter = {

    # These three are required
    networking.hostName = "gunter";
    system.stateVersion = "26.05";
    hardware.facter.reportPath = ./facter.json;

    boot.loader.efi.canTouchEfiVariables = true;
  };
}
