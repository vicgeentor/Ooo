{
  flake.modules.nixos.grafana = nixosArgs: {
    age.secrets = {
      grafana = {
        file = ../../_secrets/grafana.age;
        mode = "770";
        owner = "grafana";
        group = "grafana";
      };
      vicgeentor-mail-password-grafana = {
        file = ../../_secrets/vicgeentor-mail-password-grafana.age;
        mode = "770";
        owner = "grafana";
        group = "grafana";
      };
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
          secret_key = "$__file{${nixosArgs.config.age.secrets.grafana.path}}";
        };
        smtp = {
          enabled = true;
          user = "vicgeentor.nl";
          password = "$__file{${nixosArgs.config.age.secrets.vicgeentor-mail-password-grafana.path}}";
          host = "mail-eu.smtp2go.com:2525";
          from_address = "grafana-no-reply@vicgeentor.nl";
          startTLS_policy = "MandatoryStartTLS";
        };
      };
    };
  };
}
