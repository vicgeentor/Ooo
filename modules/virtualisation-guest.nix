{
  flake.modules.nixos.virtualisation-guest = {
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  };
}
