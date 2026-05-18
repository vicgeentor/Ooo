{
  flake.modules.nixos.calibre =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.calibre ];
      networking.firewall.allowedTCPPorts = [ 9090 ];
      networking.firewall.allowedUDPPorts = [ 54982 ];
    };
}
