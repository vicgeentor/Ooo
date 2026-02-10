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
        enable = false; # TODO: check if this is compatible with dms-shell
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

      # batterylife check and notification
      systemd.user.timers."batterylife-check" = {
        enable = false; # not needed anymore with dms-shell
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnBootSec = "5m";
          OnUnitActiveSec = "5m";
          Unit = "batterylife-check.service";
        };
      };

      systemd.user.services."batterylife-check" = {
        script = ''
          export DISPLAY=:0 # Cannot autolaunch D-Bus without X11 $DISPLAY error fix
          # Set the threshold for low battery (percentage)
          threshold=20
          # Get the battery status
          battery_status=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gawk}/bin/awk -F'[,:%]' '{print $2}')
          # Get the battery percentage
          battery_percentage=$(${pkgs.acpi}/bin/acpi -b | ${pkgs.gawk}/bin/awk -F'[,:%]' '/Battery/ {gsub(/ /,"",$3); print $3}')
          # Check if the battery is below the threshold
          if [ "$battery_status" != " Charging" ] && [ "$battery_percentage" -le "$threshold" ]; then
              ${pkgs.dunst}/bin/dunstify -a "batteryCritical" -u critical -i battery -h string:x-dunst-stack-tag:"batteryCritical" -h int:value:"$battery_percentage" "Battery: ''${battery_percentage}%"
          fi
        '';
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
}
