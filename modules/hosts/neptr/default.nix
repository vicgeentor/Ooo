{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.neptr = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      neptr

      base

      gnome
      virtualisation-guest
    ];
  };
}
