{
  flake.modules.nixos.tailscale =
    { pkgs, ... }:
    {
      services.tailscale = {
        enable = true;
        useRoutingFeatures = "both";
      };

      # Prevent autostart
      # systemd.services.tailscaled.wantedBy = lib.mkForce [];

      # Start and stop command
      environment.systemPackages = [
        (pkgs.writeShellScriptBin "tailscale-start" ''
          sudo systemctl start tailscaled
          sudo tailscale up
        '')
        (pkgs.writeShellScriptBin "tailscale-stop" ''
          sudo tailscale down
          sudo systemctl stop tailscaled
        '')
      ];
    };
}
