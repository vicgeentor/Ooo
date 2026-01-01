{
  flake.modules.homeManager.my-scripts = hmArgs: {
    home.file.".local/bin".source =
      hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/my-scripts";
  };
}
