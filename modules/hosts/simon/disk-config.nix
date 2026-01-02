{
  flake.modules.nixos.simon = {

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/d83bb23a-2834-49ff-9d54-a02b63fe0499";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/1E6D-DE85";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/fa8af231-9b67-459f-9199-717b62b03d5d"; }
    ];

  };
}
