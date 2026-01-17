{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.gunther = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      gunther

      base

      btrfs
      fwupd
      ssd
      ssh
      systemdboot
      tailscale
    ];
  };
}
