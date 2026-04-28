{
  flake.modules.nixos.pangolin =
    nixosArgs@{ lib, ... }:
    {
      # REMOVE: the following overlay when https://github.com/NixOS/nixpkgs/pull/512834 is merged into nixos-unstable.
      # To check it, see https://github.com/NixOS/nixpkgs/commits/nixos-unstable/pkgs/by-name/rs/rspamd/package.nix
      nixpkgs.overlays = [
        (self: super: {
          rspamd = super.rspamd.overrideAttrs (old: {
            cmakeFlags = (old.cmakeFlags or [ ]) ++ [
              "-DSYSTEM_DOCTEST=OFF"
            ];
            buildInputs = builtins.filter (p: p.pname or "" != "doctest") (old.buildInputs or [ ]);
          });
        })
      ];

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
    };
}
