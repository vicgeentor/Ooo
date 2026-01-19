{
  flake.modules.nixos.base = {
    hardware.facter.detected.dhcp.enable = false;
  };
}
