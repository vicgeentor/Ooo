{
  flake.modules.nixos.tailscale = nixosArgs: {
    age.secrets.tailscale.file = ../../_secrets/tailscale.age;

    services.tailscale = {
      enable = true;
      useRoutingFeatures = "none";
      authKeyFile = nixosArgs.config.age.secrets.tailscale.path;
      extraUpFlags = [
        "--netfilter-mode=nodivert"
        "--ssh"
      ];
    };

    # https://github.com/tailscale/tailscale/issues/3932
    systemd.services.tailscaled.after = [ "wpa_supplicant.service" ];
  };
}
