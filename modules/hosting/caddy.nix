{
  flake.modules.nixos.caddy = {
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];

    services.caddy = {
      enable = true;
      virtualHosts."bazarr.victb.nl".extraConfig = ''
        reverse_proxy http://localhost:4444
      '';
    };

  };
}
