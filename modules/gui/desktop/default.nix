{
  flake.modules.homeManager.desktop = hmArgs: {
    home.file = {
      ".local/share/applications".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/desktop/applications";
      ".config/mimeapps.list".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/desktop/mimeapps.list";
    };
  };
}
