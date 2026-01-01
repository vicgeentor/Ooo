{
  flake.modules.homeManager.scripts = hmArgs: {
    home.file.".local/bin".source =
      hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/shell/scripts";
  };
}
