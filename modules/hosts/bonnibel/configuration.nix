{
  flake.modules.nixos.bonnibel =
    { modulesPath, ... }:
    {

      # These three are required
      networking.hostName = "bonnibel";
      system.stateVersion = "26.05";
      hardware.facter.reportPath = ./facter.json;

      boot.loader = {
        grub = {
          efiSupport = true;
          efiInstallAsRemovable = true;
        };
      };

      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        (modulesPath + "/profiles/qemu-guest.nix")
      ];
    };
}
