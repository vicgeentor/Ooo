{
  flake.modules.nixos.intel =
    { pkgs, ... }:
    {
      hardware.graphics.extraPackages = [
        pkgs.intel-media-driver # LIBVA_DRIVER_NAME=iHD
      ];
      services.xserver.videoDrivers = [ "intel" ];

      # Force intel-media-driver
      # environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
    };
}
