# Run `nixos-facter -- -o facter.json`
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.nixos-facter ];
      hardware.facter.detected.dhcp.enable = false;
    };
}
