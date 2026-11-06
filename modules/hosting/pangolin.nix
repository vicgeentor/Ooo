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
        settings = {
          app = {
            log_failed_attempts = true;
            save_logs = true;
          };
          domains.domain1 = {
            prefer_wildcard_cert = true;
          };
          email = {
            smtp_host = "mail.vicgeentor.nl";
            smtp_port = 465;
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
        # in your NixOS configuration
      };

      services.traefik = {
        environmentFiles = [ nixosArgs.config.age.secrets.cloudflare-dns-api.path ];
        staticConfigOptions = {
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
      };

      # Fixes:
      systemd.services.pangolin.serviceConfig = {
        User = lib.mkForce "pangolin";
        Group = lib.mkForce "fossorial";
        ReadWritePaths = [ "/var/lib/pangolin" ];
        ExecStartPre = "+${pkgs.coreutils}/bin/chown -R pangolin:fossorial /var/lib/pangolin";
      };
      systemd.services.traefik.serviceConfig = {
        User = lib.mkForce "pangolin";
        Group = lib.mkForce "fossorial";
        ExecStartPre = "+${pkgs.coreutils}/bin/chown -R pangolin:fossorial /var/lib/pangolin";
      };
      systemd.services.gerbil.serviceConfig = {
        User = lib.mkForce "pangolin";
        Group = lib.mkForce "fossorial";
        ExecStartPre = "+${pkgs.coreutils}/bin/chown -R pangolin:fossorial /var/lib/pangolin";
      };

      system.activationScripts.pangolin-ad-hoc-fixes = {
        deps = [
          "users"
          "groups"
        ];
        text = ''
          rm -rf /var/lib/pangolin/.next
        '';
      };

      systemd.tmpfiles.rules = [
        "d /var/lib/pangolin 0750 pangolin fossorial - -"
        "Z /var/lib/pangolin - pangolin fossorial - -"
      ];
    };
}
