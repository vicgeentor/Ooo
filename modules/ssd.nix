{
  flake.modules.nixos.ssd = {
    services.fstrim.enable = true; # Weekly SSD trimming
  };
}
