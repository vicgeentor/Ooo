{
  flake.modules.homeManager.desktop-applications = hmArgs: {
    home.file = {
      ".local/share/applications".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/desktop-applications/applications";
    };
  };
}
