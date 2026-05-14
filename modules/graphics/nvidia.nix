{
  flake.modules.nixos.nvidia =
    nixosArgs@{ pkgs, lib, ... }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware = {
        nvidia = {
          modesetting.enable = true;
          open = true;
          package = lib.mkDefault nixosArgs.config.boot.kernelPackages.nvidiaPackages.beta;
        };
        graphics.extraPackages = [ pkgs.nvidia-vaapi-driver ];
      };

      environment.systemPackages = with pkgs; [
        egl-wayland
      ];

      boot.kernelParams = [
        "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      ];
    };
}
