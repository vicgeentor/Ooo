{ inputs, ... }:
{
  flake.modules.nixos.acer-wmi =
    nixosArgs@{ pkgs, ... }:
    let
      kernelPackages = nixosArgs.config.boot.kernelPackages.extend (
        final: prev: {
          acer-wmi-battery =
            inputs.my-acer-wmi-branch.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages.acer-wmi-battery;
        }
      );
    in
    {
      boot = {
        extraModulePackages = [
          # nixosArgs.config.boot.kernelPackages.acer-wmi-battery
          kernelPackages.acer-wmi-battery
        ];
        kernelModules = [ "acer-wmi-battery" ];
        extraModprobeConfig = ''
          options acer-wmi-battery enable_health_mode=1
        '';
      };
    };
}
