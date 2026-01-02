{ inputs, ... }:
{
  flake.modules.homeManager.quickshell =
    hmArgs@{ pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          quickshell
          kdePackages.qtdeclarative # Contains qmlls and qmllint
        ];
        file = {
          ".config/quickshell".source =
            hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/quickshell";
        };
      };
      qt.enable = true;
    };
}
