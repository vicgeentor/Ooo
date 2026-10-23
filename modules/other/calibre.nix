{ inputs, ... }:
{
  flake.modules.nixos.calibre =
    { pkgs, ... }:
    {
      environment.systemPackages = [

        # TODO: remove once https://github.com/NixOS/nixpkgs/pull/576063 is on unstable
        inputs.nixpkgs-calibre.legacyPackages.${pkgs.stdenv.hostPlatform.system}.calibre
      ];
      networking.firewall.allowedTCPPorts = [ 9090 ];
      networking.firewall.allowedUDPPorts = [ 54982 ];
    };
}
