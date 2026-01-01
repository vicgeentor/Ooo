{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      programs = {
        steam = {
          enable = true;
          gamescopeSession.enable = true;
          remotePlay.openFirewall = true;
          dedicatedServer.openFirewall = true;
        };
        gamescope.enable = true;
      };

      environment = {
        systemPackages = with pkgs; [
          # NOTE: do not forget to run `protonup` to actually install proton
          protonup-ng
        ];
        sessionVariables = {
          STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
        };
      };
    };
}
