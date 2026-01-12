{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.bonnibel = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      bonnibel

      base

      mailserver
      pangolin
      ssh
      tailscale
    ];
  };
}
