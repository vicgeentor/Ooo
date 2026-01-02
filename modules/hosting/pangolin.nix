{ inputs, ... }:
{
  flake.modules.nixos.pangolin =
    { pkgs, ... }:
    {
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
        environmentFile = "/etc/nixos/secrets/pangolin.env";
      };

      services.traefik = {
        package = inputs.nixpkgs-pangolin-stack.legacyPackages.${pkgs.stdenv.hostPlatform.system}.traefik;
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
