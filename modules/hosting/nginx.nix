{
  flake.modules.nixos.nginx = nixosArgs: {
    age.secrets.cloudflare-dns-api.file = ../../_secrets/cloudflare-dns-api.age;

    security.acme = {
      acceptTerms = true;
      defaults.email = "security@vicgeentor.nl";
      certs."victb.nl" = {
        domain = "*.victb.nl";
        dnsProvider = "cloudflare";
        environmentFile = nixosArgs.config.age.secrets.cloudflare-dns-api.path;
        dnsResolver = "1.1.1.1:53";
        dnsPropagationCheck = true;
        group = "nginx";
      };
    };

    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;

      virtualHosts = {
        "bazarr.victb.nl" = {
          forceSSL = true;
          useACMEHost = "victb.nl";

          locations."/" = {
            proxyPass = "http://localhost:4444";
            proxyWebsockets = true;
          };
        };
        "lidarr.victb.nl" = {
          forceSSL = true;
          useACMEHost = "victb.nl";

          locations."/" = {
            proxyPass = "http://localhost:4446";
            proxyWebsockets = true;
          };
        };
        "prowlarr.victb.nl" = {
          forceSSL = true;
          useACMEHost = "victb.nl";

          locations."/" = {
            proxyPass = "http://localhost:4447";
            proxyWebsockets = true;
          };
        };
        "radarr.victb.nl" = {
          forceSSL = true;
          useACMEHost = "victb.nl";

          locations."/" = {
            proxyPass = "http://localhost:4448";
            proxyWebsockets = true;
          };
        };
        "sonarr.victb.nl" = {
          forceSSL = true;
          useACMEHost = "victb.nl";

          locations."/" = {
            proxyPass = "http://localhost:4450";
            proxyWebsockets = true;
          };
        };
        "trans.victb.nl" = {
          forceSSL = true;
          useACMEHost = "victb.nl";

          locations."/" = {
            proxyPass = "http://localhost:4451";
            proxyWebsockets = true;
          };
        };
      };
    };
  };
}
