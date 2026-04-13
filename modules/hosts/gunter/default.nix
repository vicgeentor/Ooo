{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.gunter = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      gunter

      base

      btrfs
      dns
      fwupd
      minecraft-server
      ssd
      ssh
      stirling-pdf
      systemdboot
      tailscale
    ];
  };
}
