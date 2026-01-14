{
  flake.modules.nixos.grafana = nixosArgs: {
    age.secrets = {
      grafana = {
        file = ../../_secrets/grafana.age;
        mode = "770";
        owner = "grafana";
        group = "grafana";
      };
      email-password-vic-at-vicgeentornl-grafana = {
        file = ../../_secrets/email-password-vic-at-vicgeentornl-grafana.age;
        mode = "770";
        owner = "grafana";
        group = "grafana";
      };
    };

    # Dashboard that I use for the node exporter: https://grafana.com/grafana/dashboards/1860-node-exporter-full/
    services.grafana = {
      enable = true;
      settings = {
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
          user = "vic@vicgeentor.nl";
          password = "$__file{${nixosArgs.config.age.secrets.email-password-vic-at-vicgeentornl-grafana.path}}";
          host = "mail-eu.smtp2go.com:2525";
          from_address = "grafana-no-reply@vicgeentor.nl";
          startTLS_policy = "MandatoryStartTLS";
        };
      };
    };
  };
}
