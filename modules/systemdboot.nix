{
  flake.modules.nixos.systemdboot = {
    boot = {
      loader.systemd-boot = {
        enable = true;
        configurationLimit = 100;
        consoleMode = "max";
      };
    };
  };
}
