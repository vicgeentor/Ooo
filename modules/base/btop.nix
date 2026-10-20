{
  flake.modules.homeManager.base = hmArgs: {
    home.file = {
      ".config/btop/btop.conf".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/base/btop.conf";
    };
  };
}
