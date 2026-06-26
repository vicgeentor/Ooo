{
  flake.modules.nixos.laptop =
    { pkgs, ... }:
    {
      powerManagement.enable = true;
      services.thermald.enable = true;
      services.upower.enable = true;
      services.power-profiles-daemon.enable = true;

      hardware.nvidia.powerManagement.enable = true;

      environment.systemPackages = [ pkgs.auto-cpufreq ];
      services.auto-cpufreq = {
        enable = false; # not using this because dank doesn't use it
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "performance";
            turbo = "auto";
          };
        };
      };

      # systemd.user.services."battery-check" = {
      #   enable = true;
      #   description = "Notify user if battery is below 20%";
      #   partOf = [ "graphical-session.target" ];
      #   wantedBy = [ "graphical-session.target" ];
      #   serviceConfig = {
      #     Type = "oneshot";
      #     ExecStart = pkgs.writeShellScript "battery-check" ''
      #       battery=$(${pkgs.lib.getExe pkgs.upower} -i $(${pkgs.lib.getExe pkgs.upower} -e | grep BAT) | grep percentage | awk '{print $2}' | tr -d '%')
      #
      #       if [ "$battery" -le 20 ]; then
      #         ${pkgs.libnotify}/bin/notify-send -u critical -i battery-caution "Low Battery" "Level: ''${battery}%"
      #       fi
      #     '';
      #   };
      # };
      # systemd.user.timers."battery-check" = {
      #   wantedBy = [ "timers.target" ];
      #   timerConfig = {
      #     OnBootSec = "5min";
      #     OnUnitActiveSec = "5min";
      #     Unit = "battery-check.service";
      #   };
      # };
    };
}
