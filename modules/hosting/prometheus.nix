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

          # enabled by default (but here using a whitelist approach)
          "boottime"
          "cpu"
          "cpufreq"
          "diskstats"
          "filesystem"
          "hwmon"
          "loadavg"
          "meminfo"
          "netclass"
          "netdev"
          "netstat"
          "nvme"
          "os"
          "powersupplyclass"
          "thermal_zone"
          "time"
          "uname"
          "watchdog"

          # disabled by default
          "cgroups"
          "systemd"
        ];
        disabledCollectors = [
          "arp"
          "bcache"
          "bonding"
          "btrfs"
          "conntrack"
          "dmi"
          "edac"
          "entropy"
          "exec"
          "fibrechannel"
          "filefd"
          "infiniband"
          "ipvs"
          "mdadm"
          "netisr"
          "nfs"
          "nfsd"
          "pressure"
          "rapl"
          "schedstat"
          "selinux"
          "sockstat"
          "softnet"
          "stat"
          "tapestats"
          "textfile"
          "thermal"
          "timex"
          "udp_queues"
          "vmstat"
          "xfs"
          "zfs"
        ];
      };
    };
  };
}
