{ inputs, ... }:
{
  flake.modules.nixos.mailserver = nixosArgs: {
    imports = [ inputs.simple-nixos-mailserver.nixosModules.default ];

    age.secrets = {
      vicgeentor-mail-password.file = ../../_secrets/vicgeentor-mail-password.age;
      cloudflare-dns-api.file = ../../_secrets/cloudflare-dns-api.age;
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

      # A list of all login accounts. To create the password hashes, use
      # nix-shell -p mkpasswd --run 'mkpasswd -s'
      loginAccounts = {
        "vic@vicgeentor.nl" = {
          hashedPasswordFile = nixosArgs.config.age.secrets.vicgeentor-mail.path;
          aliases = [ "me@vicgeentor.nl" ];
        };
      };
    };
  };
}
