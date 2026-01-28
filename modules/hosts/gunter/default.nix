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
      fwupd
      minecraft-server-two
      owncloud
      ssd
      ssh
      stirling-pdf
      systemdboot
      tailscale
    ];
  };
}
