{
  flake.modules.nixos.laptop =
    { pkgs, ... }:
    let
    in
    {
      powerManagement.enable = true;
      services.thermald.enable = true;
      services.upower.enable = true;
      services.power-profiles-daemon.enable = true;

      hardware.nvidia.powerManagement.enable = true;

      environment.systemPackages = [ pkgs.auto-cpufreq ];
      services = {
        auto-cpufreq = {
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

      };

      # Not needed anymore because of DMS
      # systemd.user = {
      #   services.battery-check = {
      #     partOf = [ "graphical-session.target" ];
      #     after = [ "graphical-session.target" ];
      #     serviceConfig = {
      #       Type = "oneshot";
      #       ExecStart = pkgs.writeShellScript "lowBatteryNotifier" ''
      #         LOW_BAT=20
      #         EXTREME_BAT=5
      #
      #         BAT_PCT=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gnugrep}/bin/grep -P -o '[0-9]+(?=%)')
      #         [ -n "$BAT_PCT" ] || exit 0
      #         BAT_STA=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gnugrep}/bin/grep -P -o '\w+(?=,)')
      #
      #         echo "$(date) battery status: $BAT_STA percentage: $BAT_PCT"
      #
      #         test "$BAT_PCT" -le "$LOW_BAT" &&
      #           test "$BAT_PCT" -gt "$EXTREME_BAT" &&
      #           test "$BAT_STA" = "Discharging" &&
      #           ${pkgs.libnotify}/bin/notify-send -c device -u normal \
      #             "Low Battery" "$BAT_PCT%"
      #
      #         test "$BAT_PCT" -le "$EXTREME_BAT" &&
      #           test "$BAT_STA" = "Discharging" &&
      #           ${pkgs.libnotify}/bin/notify-send -c device -u critical \
      #             "Extremely Low Battery" "$BAT_PCT%"
      #       '';
      #     };
      #   };
      #
      #   timers.battery-check = {
      #     wantedBy = [ "timers.target" ];
      #     timerConfig = {
      #       OnBootSec = "5min";
      #       OnUnitActiveSec = "5min";
      #     };
      #   };
      # };
    };
}
