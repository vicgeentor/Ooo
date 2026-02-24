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
    };
}
