{ inputs, ... }:
{
  flake.modules.nixos.pangolin =
    nixosArgs@{ pkgs, lib, ... }:
    {
      age.secrets = {
        pangolin.file = ../../_secrets/pangolin.age;
        cloudflare-dns-api.file = lib.mkDefault ../../_secrets/cloudflare-dns-api.age;
      };

      networking.firewall = {
        allowedTCPPorts = [
          22
          80
          443

          # Minecraft raw TCP stream through pangolin
          25565
          25575
        ];
        allowedUDPPorts = [
          21820
          51820
        ];
      };

      services.pangolin = {
        enable = true;
        package =
          inputs.nixpkgs-pangolin-stack.legacyPackages.${pkgs.stdenv.hostPlatform.system}.fosrl-pangolin;
        settings = {
          app = {
            log_failed_attempts = true;
            save_logs = true;
          };
          domains.domain1 = {
            prefer_wildcard_cert = true;
          };
          email = {
            smtp_host = "mail-eu.smtp2go.com";
            smtp_port = 2525;
            smtp_user = "vic@vicgeentor.nl";
            smtp-secure = true;
            no-reply = "pangolin-no-reply@vicgeentor.nl";
          };
          flags = {
            allow_raw_resources = true;
            disable_signup_without_invite = true;
            disable-user-create-org = true;
            enable_integration_api = true;
          };
          server = {
            dashboard_session_length_hours = 1;
          };
        };
        dnsProvider = "cloudflare";
        baseDomain = "vicgeentor.nl";
        dashboardDomain = "admin.vicgeentor.nl";
        letsEncryptEmail = "security@vicgeentor.nl";
        openFirewall = true;
        environmentFile = nixosArgs.config.age.secrets.pangolin.path;
      };

      services.traefik = {
        package = inputs.nixpkgs-pangolin-stack.legacyPackages.${pkgs.stdenv.hostPlatform.system}.traefik;
        environmentFiles = [ nixosArgs.config.age.secrets.cloudflare-dns-api.path ];
        static.settings = {
          entryPoints = {
            # Minecraft raw TCP streams through pangolin
            tcp-25565 = {
              address = ":25565/tcp";
            };
            tcp-25575 = {
              address = ":25575/tcp";
            };
          };
        };
        dynamic.dir = "/var/lib/traefik";
      };
    };
}
