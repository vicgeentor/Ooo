{ inputs, ... }:
{
  flake.modules.nixos.dms-shell = {
    imports = [ inputs.dms.nixosModules.dank-material-shell ];

    programs.dank-material-shell = {
      enable = true;
      systemd.enable = true;
      enableCalendarEvents = false;
      enableDynamicTheming = false;
    };
  };
  flake.modules.homeManager.dms-shell = hmArgs: {
    home.file = {
      ".config/DankMaterialShell/settings.json".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/dms-shell/settings.json";
    };
  };
}
