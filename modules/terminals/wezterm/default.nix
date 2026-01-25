{ inputs, ... }:
{
  flake.modules.homeManager.wezterm =
    hmArgs@{ pkgs, ... }:
    {
      programs.wezterm = {
        enable = true;
        package = inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      home.file = {
        ".config/wezterm".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/terminals/wezterm";
      };
    };

  perSystem.treefmt.programs.stylua.enable = true;
}
