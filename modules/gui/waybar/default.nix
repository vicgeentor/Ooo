{ inputs, ... }:
{
  flake.modules.homeManager.waybar =
    hmArgs@{ pkgs, ... }:
    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        package = (
          inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
          })
        );
      };
      home = {
        file = {
          ".config/waybar/style.css".source =
            hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/waybar/style.css";
          ".config/waybar/config".source =
            hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/waybar/config";
        };
      };
    };

  perSystem.treefmt.programs.prettier.enable = true;
}
