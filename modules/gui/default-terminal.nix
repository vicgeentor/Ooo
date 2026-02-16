let
  term = "ghostty";
in
{
  flake.modules.nixos.default-terminal = {
    environment.sessionVariables.TERMINAL = term;

    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = [ "ghostty.desktop" ];
      };
    };
  };

  flake.modules.homeManager.default-terminal =
    { pkgs, ... }:
    {
      dconf.settings."org/cinnamon/desktop/applications/terminal".exec = term;
      home.packages = [
        (pkgs.writers.writeDashBin "xterm" ''
          ghostty -e "$@"
        '')
      ];
    };
}
