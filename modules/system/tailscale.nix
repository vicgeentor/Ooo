{
  flake.modules.nixos.tailscale =
    nixosArgs@{ pkgs, ... }:
    {
      age.secrets.tailscale.file = ../../_secrets/tailscale.age;

      services.tailscale = {
        enable = true;
        useRoutingFeatures = "both";
        authKeyFile = nixosArgs.config.age.secrets.tailscale.path;
        extraUpFlags = [
          "--ssh"
        ];
      };

      # https://github.com/tailscale/tailscale/issues/3932
      systemd.services.tailscaled.after = [ "wpa_supplicant.service" ];

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
