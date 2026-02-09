{
  flake.modules.nixos.bluetooth = {
    hardware = {
      bluetooth.enable = true;
    };

    # Not needed anymore with dms-shell
    # services.blueman.enable = true;
  };
}
