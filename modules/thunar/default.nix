{
  flake.modules.nixos.thunar =
    { pkgs, ... }:
    {
      services = {
        gvfs.enable = true; # Mount, trash, and other functionalities
        tumbler.enable = true; # Thumbnail support for images
      };
      programs.thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      };
    };
  flake.modules.homeManager.thunar = hmArgs: {
    home.file = {
      ".config/Thunar/uca.xml".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/thunar/uca.xml";
    };
  };
}
