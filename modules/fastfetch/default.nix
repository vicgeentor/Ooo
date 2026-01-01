{
  flake.modules.homeManager.fastfetch =
    hmArgs@{ pkgs, ... }:
    {
      home.packages = [ pkgs.fastfetch ];
      home.file = {
        ".config/fastfetch/config.jsonc".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/fastfetch/config.jsonc";
      };
    };
}
