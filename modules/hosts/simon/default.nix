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
      minecraft-server
      networkmanager
      newt
      ssh
      # stirling-pdf # NOTE: removing until the weasyprint package (dependency of stirling-pdf) is fixed
      systemdboot
      tailscale # WARNING: Make sure to start with `tailscale up --accept-dns=false` to disable custom tailscale dns nameservers
      your-spotify
    ];
  };
}
