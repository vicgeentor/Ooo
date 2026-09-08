{ config, inputs, ... }:
{
  flake.modules.nixos.dank =
    { pkgs, ... }:
    {
      imports = [
        inputs.dms-plugin-registry.nixosModules.default
      ];

      programs.dms-shell = {
        enable = true;
        systemd.enable = true;
        enableAudioWavelength = false;
        enableCalendarEvents = false;
        enableDynamicTheming = false;

        plugins = {
          emojiLauncher.enable = true;
          niriDS.enable = true;
        };
      };

      environment.systemPackages = [ pkgs.wl-mirror ];

      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/${config.flake.meta.vic.username}";
        logs = {
          save = true;
          path = "/tmp/dms-greeter.log";
        };
      };

      users.users.${config.flake.meta.vic.username}.extraGroups = [
        "greeter"
      ];

    };
  flake.modules.homeManager.dank = hmArgs: {
    home.file = {
      ".config/DankMaterialShell/settings.json".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/dank/settings.json";
    };
  };
}
