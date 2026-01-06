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
          domains.domain1 = {
            prefer_wildcard_cert = true;
          };
          flags = {
            allow_raw_resources = true;
            disable_signup_without_invite = true;
            enable_integration_api = true;
          };
        };
        dnsProvider = "cloudflare";
        baseDomain = "vicgeentor.nl";
        dashboardDomain = "admin.vicgeentor.nl";
        letsEncryptEmail = "victenbokum@gmail.com";
        openFirewall = true;
        environmentFile = nixosArgs.config.age.secrets.pangolin.path;
      };

      services.traefik = {
        package = inputs.nixpkgs-pangolin-stack.legacyPackages.${pkgs.stdenv.hostPlatform.system}.traefik;
        environmentFiles = [ nixosArgs.config.age.secrets.cloudflare-dns-api.path ];
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
