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

      transmission = {
        enable = true;
        vpn.enable = true;
        peerPort = 50000; # Set this to the port forwarded by your VPN
      };

      jellyfin.enable = true;
      jellyseerr.enable = true;

      prowlarr.enable = true;
      radarr.enable = true;
      sonarr.enable = true;
    };
  };
}
