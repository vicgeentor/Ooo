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
        plugins = with pkgs; [
          thunar-archive-plugin
          thunar-volman
        ];
      };

      environment.sessionVariables.FILE_PICKER = "thunar";
    };
  flake.modules.homeManager.thunar = hmArgs: {
    home.file = {
      ".config/Thunar/uca.xml".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/thunar/uca.xml";
    };
  };

  perSystem.treefmt.programs.xmllint.enable = true;
}
