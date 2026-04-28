{ inputs, ... }:
{
  flake.modules.nixos.dank =
    { pkgs, ... }:
    {
      imports = [
        inputs.dms-plugin-registry.modules.default
      ];

      programs.dms-shell = {
        enable = true;
        systemd.enable = true;
        enableAudioWavelength = false;
        enableCalendarEvents = false;
        enableDynamicTheming = false;

        plugins = {
          emojiLauncher.enable = true;
          displayMirror.enable = true;
        };
      };

      environment.systemPackages = [ pkgs.wl-mirror ];

    };
  flake.modules.homeManager.dank = hmArgs: {
    home.file = {
      ".config/DankMaterialShell/settings.json".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/dank/settings.json";
    };
  };
}
