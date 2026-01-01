{
  flake.modules.nixos.nvidia =
    {
      pkgs,
      config,
      ...
    }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware = {
        nvidia = {
          modesetting.enable = true;
          powerManagement.enable = true;
          open = true;
          package = config.boot.kernelPackages.nvidiaPackages.beta;
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
