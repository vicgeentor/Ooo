{
  flake.modules.homeManager.alacritty =
    hmArgs@{
      pkgs,
      ...
    }:
    {
      home.packages = [ pkgs.alacritty ];
      home.file = {
        ".config/alacritty/alacritty.toml".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/terminals/alacritty/alacritty.toml";
      };
    };
}
