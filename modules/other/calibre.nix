{inputs,...}: {
  flake.modules.nixos.calibre =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.nixpkgs-calibre.legacyPackages.${pkgs.stdenv.hostPlatform.system}.calibre
      ];
      networking.firewall.allowedTCPPorts = [ 9090 ];
      networking.firewall.allowedUDPPorts = [ 54982 ];
    };
}
