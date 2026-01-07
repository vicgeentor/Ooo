# See https://nixos-mailserver.readthedocs.io/en/latest/setup-guide.html for DNS setup.
{ inputs, ... }:
{
  flake.modules.nixos.mailserver =
    nixosArgs@{ lib, ... }:
    {
      imports = [ inputs.simple-nixos-mailserver.nixosModules.default ];

      age.secrets = {
        vicgeentor-mail-password.file = ../../_secrets/vicgeentor-mail-password.age;
        cloudflare-dns-api.file = ../../_secrets/cloudflare-dns-api.age;
      };

      networking.firewall.allowedTCPPorts = [
        25
        465
        587
        993
      ];

      services.postfix.settings.main = {
        smtp_sasl_auth_enable = "yes";
        smtp_sasl_password_maps = "static:vicgeentor.nl:Diaphragm-Eastcoast-Femur-Clapper9-Reptile";
        smtp_sasl_security_options = "noanonymous";
        smtp_tls_security_level = lib.mkForce "may";
        header_size_limit = 4096000;
        relayhost = [ "[mail-eu.smtp2go.com]:2525" ];
        relay_destination_concurrency_limit = 20;
      };

      security.acme = {
        acceptTerms = true;
        defaults.email = "security@vicgeentor.nl";
        certs.${nixosArgs.config.mailserver.fqdn} = {
          dnsProvider = "cloudflare";
          environmentFile = nixosArgs.config.age.secrets.cloudflare-dns-api.path;

          dnsResolver = "1.1.1.1:53"; # Cloudflare's public resolver
          dnsPropagationCheck = true;
        };
      };

      mailserver = {
        enable = true;
        stateVersion = 3;
        fqdn = "mail.vicgeentor.nl";
        domains = [ "vicgeentor.nl" ];
        x509.useACMEHost = nixosArgs.config.mailserver.fqdn;
        dmarcReporting.enable = true;

        # A list of all login accounts. To create the password hashes, use
        # nix-shell -p mkpasswd --run 'mkpasswd -s'
        loginAccounts = {
          "vic@vicgeentor.nl" = {
            hashedPasswordFile = nixosArgs.config.age.secrets.vicgeentor-mail-password.path;
            aliases = [ "@vicgeentor.nl" ];
          };
        };
      };
    };
}
