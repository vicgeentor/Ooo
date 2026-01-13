{
  flake.modules.nixos.prometheus = nixosArgs: {
    services.prometheus = {
      enable = true;
      port = 9001;
      globalConfig.scrape_interval = "15s";

      scrapeConfigs = [
        {
          job_name = "node";
          static_configs = [
            {
              targets = [ "localhost:${toString nixosArgs.config.services.prometheus.exporters.node.port}" ];
            }
          ];
        }
      ];

      exporters.node = {
        enable = true;
        port = 9002;

        # see ./_prometheus-collectors.txt or nix run nixpkgs#prometheus-node-exporter -- --help
        enabledCollectors = [
          "cpu"
          "diskstats"
          "systemd"
        ];
      };
    };
  };
}
