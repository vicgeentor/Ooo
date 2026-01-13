{
  flake.modules.nixos.grafana = {
    services.grafana = {
      enable = true;
      settings = {
        dashboards = {
          min_refresh_interval = "1s";
        };
        server = {
          http_addr = "127.0.0.1";
          http_port = 3030;
          domain = "metrics.vicgeentor.nl";
        };
      };
    };
  };
}
