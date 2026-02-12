{ inputs, ... }:
{
  flake.modules.nixos.dank = {
    imports = [ inputs.dms.nixosModules.dank-material-shell ];

    programs.dank-material-shell = {
      enable = true;
      systemd.enable = true;
      enableAudioWavelength = false;
      enableCalendarEvents = false;
      enableDynamicTheming = false;
    };
  };
  flake.modules.homeManager.dank = hmArgs: {
    home.file = {
      ".config/DankMaterialShell/settings.json".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/dank/settings.json";
    };
  };
}
