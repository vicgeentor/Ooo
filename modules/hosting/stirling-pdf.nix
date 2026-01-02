{
  flake.modules.nixos.stirling-pdf = {
    services.stirling-pdf = {
      enable = true;
      environment.SERVER_PORT = 9090;
    };
  };
}
