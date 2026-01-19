{
  flake.modules.nixos.simon =
    nixosArgs@{ lib, ... }:
    {

      # These three are required
      networking.hostName = "simon";
      system.stateVersion = "24.11";
      hardware.facter.reportPath = ./facter.json;
      hardware.facter.detected.bluetooth.enable = false;

      boot = {
        loader.efi.canTouchEfiVariables = true;
        extraModprobeConfig = ''
          options snd_hda_intel power_save=0
        '';
      };

      hardware = {
        bluetooth.enable = false;
        nvidia = {
          open = lib.mkForce false;
          nvidiaPersistenced = true;
          package = nixosArgs.config.boot.kernelPackages.nvidiaPackages.mkDriver {
            version = "580.126.09";
            sha256_64bit = "sha256-TKxT5I+K3/Zh1HyHiO0kBZokjJ/YCYzq/QiKSYmG7CY=";
            sha256_aarch64 = "sha256-TKxT5I+K3/Zh1HyHiO0kBZokjJ/YCYzq/QiKSYmG7CY=";
            openSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
            settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
            persistencedSha256 = "sha256-J1UwS0o/fxz45gIbH9uaKxARW+x4uOU1scvAO4rHU5Y=";
          };
        };

        nvidia-container-toolkit.enable = true;
      };
    };
}
