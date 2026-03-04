{
  flake.modules.nixos.tdarr =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = [ pkgs.tdarr ];

      systemd.services.tdarr-server = {
        description = "Tdarr Server";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = lib.getExe pkgs.tdarr-server;
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
          ExecStart = lib.getExe pkgs.tdarr-node;
          Restart = "on-failure";
          RestartSec = 5;
        };
      };
    };
}
