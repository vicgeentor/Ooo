{
  flake.modules.nixos.base = {
    programs = {
      appimage.enable = true;
      appimage.binfmt = true;

      dconf.enable = true;
    };

    hardware.enableAllFirmware = true;

    services.logind.settings.Login.HandlePowerKey = "ignore";

    documentation.man.cache.enable = false;
  };

  flake.modules.homeManager.base = {
    programs.man.generateCaches = false;
  };
}
