{ inputs, ... }:
{
  flake.modules.nixos.arr-stack =
    nixosArgs@{ pkgs, ... }:
    {
      imports = [ inputs.nixarr.nixosModules.default ];

      age.secrets = {
        wg-conf.file = ../../_secrets/wg-conf.age;
        recyclarr-yaml = {
          file = ../../_secrets/recyclarr-yaml.age;
          mode = "770";
          owner = "recyclarr";
          group = "recyclarr";
        };
        transmission-settings-json = {
          file = ../../_secrets/transmission-settings-json.age;
          mode = "770";
          owner = "transmission";
          group = "media";
        };
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

        sonarr = {
          enable = true;
          port = 4450;
        };

        transmission = {
          enable = true;
          uiPort = 4451;

          vpn.enable = true;
          peerPort = 19271;
          credentialsFile = nixosArgs.config.age.secrets.transmission-settings-json.path;
          extraSettings = {
            # Safe because only accessing through Tailscale
            rpc-whitelist-enabled = false;
            rpc-host-whitelist-enabled = false;
            rpc-authentication-required = true;
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

      services.jellyfin = {
        # forceEncodingConfig = true;
        hardwareAcceleration = {
          enable = true;
          device = "/dev/nvidia0";
          type = "nvenc";
        };
        transcoding = {
          enableHardwareEncoding = true;
          hardwareEncodingCodecs = {
            hevc = true;
          };
          hardwareDecodingCodecs = {
            h264 = true;
            hevc = true;
            hevc10bit = true;
            mpeg2 = true;
            vc1 = true;
            vp9 = true;
          };
        };
      };
      users.users.jellyfin.extraGroups = [
        "video"
        "render"
        "jellyfin"
      ];
      environment.systemPackages = [ pkgs.jellyfin-ffmpeg ];
    };
}
