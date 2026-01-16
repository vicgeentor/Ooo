{
  flake.modules.nixos.nvidia =
    nixosArgs@{ pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware = {
        nvidia = {
          modesetting.enable = true;
          open = true;
          package = nixosArgs.config.boot.kernelPackages.nvidiaPackages.beta;
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
