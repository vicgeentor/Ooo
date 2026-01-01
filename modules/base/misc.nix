{
  flake.modules.nixos.base = {
    programs = {
      appimage.enable = true;
      appimage.binfmt = true;

      dconf.enable = true;
    };

    hardware.enableAllFirmware = true;
  };
}
