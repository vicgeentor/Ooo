{ inputs, ... }:
{
  flake.modules.nixos.nixarr = nixosArgs: {
    imports = [ inputs.nixarr.nixosModules.default ];

    age.secrets.wg-nixarr-conf.file = ../../_secrets/wg-nixarr-conf.age;

    nixarr = {
      enable = true;

      vpn = {
        enable = true;
        wgConf = nixosArgs.config.age.secrets.wg-nixarr-conf.path;
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
        peerPort = 51820; # Forwarded port in wg-nixarr-conf

        extraSettings = {
          rpc-whitelist-enabled = false; # Safe because only accessing through Tailscale
        };
      };
    };
  };
}
