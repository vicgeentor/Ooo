{ inputs, ... }:
{
  flake.modules.nixos.arr-stack = nixosArgs: {
    imports = [ inputs.nixarr.nixosModules.default ];

    age.secrets = {
      wg-conf.file = ../../_secrets/wg-conf.age;
      recyclarr-yaml.file = ../../_secrets/recyclarr-yaml.age;
    };

    nixarr = {
      enable = true;

      vpn = {
        enable = true;
        wgConf = nixosArgs.config.age.secrets.wg-conf.path;
        vpnTestService = {
          enable = true;
          port = 19271;
        };
      };

      jellyfin.enable = true; # port = 8096

      bazarr = {
        enable = true;
        port = 4444;
      };

      jellyseerr = {
        enable = true;
        port = 4445;
      };

      lidarr = {
        enable = true;
        port = 4446;
      };

      prowlarr = {
        enable = true;
        port = 4447;
      };

      radarr = {
        enable = true;
        port = 4448;
      };

      readarr = {
        enable = true;
        port = 4449;
      };

      sonarr = {
        enable = true;
        port = 4450;
      };

      transmission = {
        enable = true;
        uiPort = 4451;

        vpn.enable = true;
        peerPort = 19271;
        extraSettings = {
          # Safe because only accessing through Tailscale
          rpc-whitelist-enabled = false;
          rpc-host-whitelist-enabled = false;
        };
      };

      recyclarr = {
        enable = true;
        configFile = nixosArgs.config.age.secrets.recyclarr-yaml.path;
      };
    };
    services.flaresolverr = {
      enable = true;
      port = 4452;
    };
  };
}
