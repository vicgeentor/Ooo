{ inputs, ... }:
{
  flake.modules.nixos.calibre =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        # Should change to `pkgs.calibre` after fix.
        # See https://github.com/Stebalien/nixpkgs/commit/f50833e7541c8cf9b0289ed483fee741698790b1
        inputs.nixpkgs-calibre.legacyPackages.${pkgs.stdenv.hostPlatform.system}.calibre
      ];
      networking.firewall.allowedTCPPorts = [ 9090 ];
      networking.firewall.allowedUDPPorts = [ 54982 ];
    };
}
