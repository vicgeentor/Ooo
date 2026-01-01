{
  flake.modules.nixos.acer-wmi =
    { config, ... }:
    {
      boot = {
        extraModulePackages = [ config.boot.kernelPackages.acer-wmi-battery ];
        kernelModules = [ "acer-wmi-battery" ];
        extraModprobeConfig = ''
          options acer-wmi-battery enable_health_mode=1
        '';
      };
    };
}
