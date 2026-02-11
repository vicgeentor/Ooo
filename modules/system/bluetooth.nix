{
  flake.modules.nixos.bluetooth = {
    hardware = {
      bluetooth.enable = true;
    };

    # Not needed anymore with dank
    # services.blueman.enable = true;
  };
}
