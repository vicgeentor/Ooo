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
      dns
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
      tdarr
      your-spotify
    ];
  };
}
