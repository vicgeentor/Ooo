{
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.simon = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      simon

      base

      arr-stack
      fwupd
      grafana
      graphics
      minecraft-server
      networkmanager
      nvidia
      prometheus
      ssh
      stirling-pdf
      systemdboot
      tailscale
      your-spotify
    ];
  };
}
