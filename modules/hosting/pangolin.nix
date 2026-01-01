{
  flake.modules.nixos.pangolin = {
    services.pangolin = {
      enable = true;
      settings = {
        domains.domain1 = {
          prefer_wildcard_cert = true;
        };
        flags = {
          allow_raw_resources = true;
          disable_signup_without_invite = true;
        };
      };
      dnsProvider = "cloudflare";
      baseDomain = "vicgeentor.nl";
      dashboardDomain = "admin.vicgeentor.nl";
      letsEncryptEmail = "victenbokum@gmail.com";
      openFirewall = true;
      environmentFile = "/etc/nixos/secrets/pangolin.env";
    };

    services.traefik = {
      environmentFiles = [ "/etc/nixos/secrets/traefik.env" ];
      staticConfigOptions = {
        entryPoints = {
          tcp-25565 = {
            address = ":25565/tcp";
          };
        };
      };
    };
  };
}
