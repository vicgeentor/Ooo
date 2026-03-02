{
  flake.modules.nixos.base =
    { lib, ... }:
    {
      networking.useDHCP = lib.mkDefault true; # NOTE: disable manually for specific hosts

      systemd = {
        network.wait-online.enable = false;
        services.NetworkManager-wait-online.enable = false;
      };
    };
}
