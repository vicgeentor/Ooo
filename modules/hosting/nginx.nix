{
  flake.modules.nixos.nginx = {
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;

      virtualHosts = {
        "bazarr.victb.nl" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://localhost:4444";
            proxyWebsockets = true;
          };
        };
        "lidarr.victb.nl" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://localhost:4446";
            proxyWebsockets = true;
          };
        };
        "prowlarr.victb.nl" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://localhost:4447";
            proxyWebsockets = true;
          };
        };
        "radarr.victb.nl" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://localhost:4448";
            proxyWebsockets = true;
          };
        };
        "sonarr.victb.nl" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://localhost:4450";
            proxyWebsockets = true;
          };
        };
        "trans.victb.nl" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://localhost:4451";
            proxyWebsockets = true;
          };
        };
      };

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];
    };
  };
}
