{ inputs, ... }:
{
  flake.modules.nixos.acer-wmi =
    { config, pkgs, ... }:
    let
      kernelPackages = config.boot.kernelPackages.extend (
        final: prev: {
          acer-wmi-battery =
            inputs.my-nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages.acer-wmi-battery;
        }
      );
    in
    {
      boot = {
        extraModulePackages = [
          # config.boot.kernelPackages.acer-wmi-battery
          kernelPackages.acer-wmi-battery
        ];
        kernelModules = [ "acer-wmi-battery" ];
        extraModprobeConfig = ''
          options acer-wmi-battery enable_health_mode=1
        '';
      };
    };
}
