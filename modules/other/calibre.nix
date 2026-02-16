{
  flake.modules.nixos.calibre =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.calibre ];
      networking.firewall.allowedUDPPorts = [ 54982 ];
    };
}
