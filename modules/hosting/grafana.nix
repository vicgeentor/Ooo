{
  flake.modules.nixos.grafana = nixosArgs: {
    age.secrets = {
      grafana.file = ../../_secrets/grafana.age;
      vicgeentor-mail-password.file = ../../_secrets/vicgeentor-mail-password.age;
    };

    services.grafana = {
      enable = true;
      settings = {
        dashboards = {
          min_refresh_interval = "1s";
        };
        server = {
          http_addr = "127.0.0.1";
          http_port = 3030;
          root_url = "https://metrics.vicgeentor.nl";
          enable_gzip = true;
        };
        security = {
          secret_key = "$__file{${nixosArgs.config.age.secrets.gragana.path}}";
        };
        smtp = {
          enabled = true;
          user = "vic@vicgeentor.nl";
          password = "$__file{${nixosArgs.config.age.secrets.vicgeentor-mail-password.path}}";
          host = "mail-eu.smtp2go.com:2525";
          from_address = "grafana-no-reply@vicgeentor.nl";
        };
      };
    };
  };
}
