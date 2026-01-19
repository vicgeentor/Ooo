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

      acme
      arr-stack
      fwupd
      grafana
      graphics
      minecraft-server
      networkmanager
      nginx
      nvidia
      prometheus
      ssh
      systemdboot
      tailscale
      your-spotify
    ];
  };
}
