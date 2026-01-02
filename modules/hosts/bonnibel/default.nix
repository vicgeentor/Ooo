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

      pangolin
      ssh
      tailscale # WARNING: Make sure to start with `tailscale up --accept-dns=false --netfilter-mode=nodivert` for pangolin to work
    ];
  };
}
