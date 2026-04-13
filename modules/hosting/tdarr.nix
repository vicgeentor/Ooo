{ inputs, ... }:
{
  flake.modules.nixos.tdarr =
    { lib, ... }:
    # Switch to simple pkgs.tdarr, pkgs.tdarr-server, and pkgs.tdarr-node when
    # https://github.com/NixOS/nixpkgs/pull/505887 gets pulled.
    let
      pkgs-tdarr = import inputs.nixpkgs-tdarr {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      environment.systemPackages = [ pkgs-tdarr.tdarr ];

      systemd.services.tdarr-server = {
        description = "Tdarr Server";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = lib.getExe pkgs-tdarr.tdarr-server;
          Restart = "on-failure";
          RestartSec = 5;
        };
        environment.openBrowser = "false";
      };

      systemd.services.tdarr-node = {
        description = "Tdarr Node";
        after = [
          "network.target"
          "tdarr-server.service"
        ];
        wants = [ "tdarr-server.service" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = lib.getExe pkgs-tdarr.tdarr-node;
          Restart = "on-failure";
          RestartSec = 5;
        };
      };
    };
}
