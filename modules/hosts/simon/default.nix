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
      graphics
      networkmanager
      nginx
      nvidia
      ssh
      systemdboot
      tailscale
      tdarr
    ];
  };
}
