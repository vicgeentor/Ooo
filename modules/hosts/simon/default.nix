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

      fwupd
      grafana
      minecraft-server
      networkmanager
      newt
      prometheus
      ssh
      stirling-pdf
      systemdboot
      tailscale
      your-spotify
    ];
  };
}
