{ inputs, ... }:
{
  flake.modules.nixos.calibre =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        # Switch to pkgs.tdarr after calibre is version 9.7.0 in nixpkgs
        inputs.nixpkgs-calibre.legacyPackages.${pkgs.stdenv.hostPlatform.system}.calibre
      ];
      networking.firewall.allowedTCPPorts = [ 9090 ];
      networking.firewall.allowedUDPPorts = [ 54982 ];
    };
}
