{ inputs, ... }:
{
  flake.modules.homeManager.quickshell =
    hmArgs@{ pkgs, ... }:
    {
      home = {
        packages = [
          inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
          pkgs.kdePackages.qtdeclarative # Contains qmlls and qmllint
        ];
        file = {
          ".config/quickshell".source =
            hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/quickshell";
        };
      };
      qt.enable = true;
    };
}
