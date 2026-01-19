# sudo nix run --option experimental-features "nix-command flakes" nixpkgs#nixos-facter -- -o facter.json
{
  flake.modules.nixos.base = {
    hardware.facter.detected.dhcp.enable = false;
  };
}
